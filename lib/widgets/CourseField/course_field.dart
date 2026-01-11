import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/checkbox/checkbox_cubit.dart';
import 'package:table/bloc/course_cubit.dart';
import 'package:table/core/constants/days.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/entity/course_duration.dart';
import 'package:table/widgets/CourseField/add_course.dart';
import 'package:table/widgets/CourseField/add_section.dart';
import 'package:table/widgets/searchable_field.dart';


class CourseField extends StatelessWidget {
  final CourseDuration? parent;
  final CoursesCubit cubit;
  final bool isSection;
  const CourseField({
    super.key,
    required this.cubit,
    this.isSection = false,
    this.parent,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: _CourseFieldStatful(
        cubit: cubit,
        isSection: isSection,
        parent: parent,
      ),
    );
  }
}
class _CourseFieldStatful extends StatefulWidget {
  final CourseDuration? parent;
  final CoursesCubit cubit;
  final bool isSection;
  const _CourseFieldStatful({
    required this.cubit,
    this.isSection = false,
    this.parent,
  });

  @override
  State<_CourseFieldStatful> createState() => _CourseFieldState();
}

class _CourseFieldState extends State<_CourseFieldStatful> {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  String day = Days.saturday;
  bool hasSection = false;

  @override
  void initState() {
    super.initState();
    // If this is a section field, reset hasSection to false
    if (widget.isSection) {
      hasSection = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isSection)
              SearchableTextField(
                labelText: widget.isSection ? "اسم السكشن" : "اسم المادة",
                searchList: Electrical().allCoursesList,
                controller: courseNameController,
                showEnglish: false,
                onSelected: (course) {
                  print("Selected course: ${course.id} - ${course.name}");
                },
              ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "البدء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                    controller: startTimeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "الانتهاء",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                    controller: endTimeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                if (!widget.isSection)
                  Row(
                    children: [
                      Checkbox(
                        value: hasSection,
                        onChanged: (bool? value) {
                          setState(() {
                            hasSection = value ?? false;
                          });
                        },
                      ),
                      const Text("تحتوي على سكشن؟"),
                      const SizedBox(width: 16),
                    ],
                  ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "اليوم",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    initialValue: Days.saturday,
                    items: <String>[...Days.days]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        day = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),

            const SizedBox(height: 16),

            if (!hasSection || widget.isSection)
              ElevatedButton(
                onPressed: () async {
                  if (widget.isSection) {

                     addSection(
                      context, 
                      widget.cubit, 
                      courseNameController, 
                      startTimeController, 
                      endTimeController, 
                      day, 
                      widget.isSection
                    );
                    // Reset checkbox after adding section
                    if (mounted) {
                      setState(() {
                        hasSection = false;
                      });
                    }
                  } else {
                     addCourse(
                      context, 
                      widget.cubit, 
                      courseNameController, 
                      startTimeController, 
                      endTimeController, 
                      day, 
                      widget.isSection,
                    );
                    // Reset checkbox after adding course
                    if (mounted) {
                      setState(() {
                        hasSection = false;
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 50),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  widget.isSection ? "إضافة السكشن" : "إضافة المادة",
                  style: const TextStyle(fontSize: 16),
                ),
              ),

            if (!widget.isSection && hasSection)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CourseField(
                  cubit: widget.cubit,
                  isSection: true,
                  parent: widget.cubit.state.selectedCourse,
                ),
              ),
          ],
        ),
      ),
    );
  }
}