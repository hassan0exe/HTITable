
  import 'package:flutter/material.dart';
import 'package:table/bloc/course_cubit.dart';
import 'package:table/entity/course_duration.dart';

void addSection(BuildContext context, CoursesCubit cubit
,
    TextEditingController courseNameController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    String day,
    bool isSection,
) {

    try {
      int startTime = int.parse(startTimeController.text);
      int endTime = endTimeController.text.isNotEmpty
          ? int.parse(endTimeController.text)
          : 9;

      print(cubit.state.selectedCourse);
      
      CourseDuration fieldedSectionDuration = CourseDuration(
        id: cubit.state.selectedCourse!.id,
        course: cubit.state.selectedCourse!.course,
        startTime: cubit.state.selectedCourse!.startTime,
        endTime: cubit.state.selectedCourse!.endTime,
        day: cubit.state.selectedCourse!.day,
        section: CourseDuration(
          id: cubit.state.selectedCourse!.id,
          course: cubit.state.selectedCourse!.course,
          startTime: startTime,
          endTime: endTime,
          day: day,
        ),
      );
    print(fieldedSectionDuration);
      cubit.addSection(fieldedSectionDuration);
      // Show a success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isSection
                ? 'تمت إضافة السكشن بنجاح'
                : 'تمت إضافة المادة بنجاح',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint("Section error $e");
    }

    
  }

