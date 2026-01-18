import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/courseField/course_event.dart';
import 'package:table/bloc/courseField/course_state.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/core/constants/days.dart';
import 'package:table/core/constants/local_text.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/entity/course_duration.dart';
import 'package:table/widgets/CourseField/add_course.dart';
import 'package:table/widgets/CourseField/section_form_field.dart';
import 'package:table/widgets/CourseField/text_field_form.dart';
import 'package:table/widgets/searchable_field.dart';

class CourseField extends StatelessWidget {
  final CourseDuration? parent;
  final CoursesCubit cubit;
  final CourseFormBloc bloc;
  final bool isSection;
  const CourseField({
    super.key,
    required this.cubit,
    required this.bloc,
    this.isSection = false,
    this.parent,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseFormBloc, CourseFormState>(
      builder: (context, state) {
        // Create controllers here
        final TextEditingController startTimeController = TextEditingController(
          text: "${bloc.state.lecture.start}",
        );
        final TextEditingController endTimeController = TextEditingController(
          text: "${bloc.state.lecture.end}",
        );
        final TextEditingController
        startSectionTimeController = TextEditingController(
          text:
              "${bloc.state.lecture.section != null ? bloc.state.lecture.section!.start : ""}",
        );
        final TextEditingController
        endSectionTimeController = TextEditingController(
          text:
              "${bloc.state.lecture.section != null ? bloc.state.lecture.section!.end : ""}",
        );
        final TextEditingController extraTimeController = TextEditingController(
          text:
              "${bloc.state.lecture.section != null ? bloc.state.lecture.section!.extraTime : ""}",
        );
        
        return Card(
          margin: const EdgeInsets.all(16),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top left trash icon button
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total units : ${
                        //each course contains units sum this uNavigatorState
                        cubit.state.courses.fold<int>(0, (sum, course) => sum + course.course.units)}",
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            tooltip: "(ضغطة مطولة لحذف الجدول بالكامل)",
                            onPressed: () {
                              cubit.removeSelectedCourse(bloc.state.lecture.course);
                              // Handle case where there's no parent, maybe clear the form or show a message
                              bloc.add(ResetFormEvent());
                            },
                            onLongPress: () {
                              cubit.removeAllSelectedCourse();
                              bloc.add(ResetFormEvent());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SearchableTextField - use value from bloc bloc.state
                SearchableTextField(
                  bloc: bloc,
                  labelText: "اسم المادة",
                  searchList: Electrical(isArabic: true).allCoursesList,
                  showEnglish: false,
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: CoustomeTextFormField(
                        text: LocalText.start,
                        timeController: startTimeController,
                        bloc: bloc,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CoustomeTextFormField(
                        text: LocalText.end,
                        timeController: endTimeController,
                        bloc: bloc,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: bloc.state.hasSection,
                          onChanged: (bool? value) {
                            bloc.add(ToggleCheckboxEvent());
                          },
                        ),
                        const Text("تحتوي على سكشن؟"),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue:
                            bloc.state.lecture.day, // Bind to bloc bloc.state
                        decoration: const InputDecoration(
                          labelText: "اليوم",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        items: <String>[...Days.days]
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                            .toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            bloc.add(ChangeDayEvent(newValue, Days.lecture));
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),

                const SizedBox(height: 16),

                if (bloc.state.hasSection)
                  SectionFormField(
                    startSectionTimeController: startSectionTimeController,
                    bloc: bloc,
                    endSectionTimeController: endSectionTimeController,
                    extraTimeController:extraTimeController,
                  ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    addCourse(
                      context: context,
                      cubit: cubit,
                      courseName: bloc.state.lecture.course.name,
                      startTimeController: startTimeController,
                      day: bloc.state.lecture.day,
                      endTimeController: endTimeController,
                      sectionDay: bloc.state.lecture.section!.day,
                      sectionEndTimeController: endSectionTimeController,
                      sectionStartTimeController: startSectionTimeController,
                      extraTimeController: extraTimeController,
                      extraDay: bloc.state.lecture.section!.extraTimeDay,
                      hasSection: bloc.state.hasSection,
                    );
                    bloc.add(ResetFormEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "إضافة المادة",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
