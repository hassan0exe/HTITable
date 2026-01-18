import 'package:flutter/material.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/core/constants/days.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/entity/course_duration_model.dart';
import 'package:table/widgets/CourseField/check_time.dart';

void addCourse({
  required BuildContext context,
  required CoursesCubit cubit,
  required String courseName,
  required TextEditingController startTimeController,
  required String day,
  required TextEditingController endTimeController,
  required bool hasSection,
  TextEditingController? sectionStartTimeController,
  TextEditingController? sectionEndTimeController,
  String? sectionDay,
  TextEditingController? extraTimeController,
  String? extraDay,
}) {
  try {
    int startTime = int.parse(startTimeController.text);
    int endTime = endTimeController.text.isNotEmpty
        ? int.parse(endTimeController.text)
        : -1;

    int sectionStartTime = sectionStartTimeController != null
        ? int.parse(sectionStartTimeController.text)
        : 0;
    int sectionEndTime = sectionEndTimeController != null
        ? sectionEndTimeController.text.isNotEmpty
              ? int.parse(sectionEndTimeController.text)
              : -1
        : 0;

    int extraTime = extraTimeController != null
        ? extraTimeController.text.isNotEmpty
              ? int.parse(extraTimeController.text)
              : 0
        : 0;

    if (courseName.isEmpty) {
      throw Exception("اسم المادة مطلوب");
    }

    // Validate that end time is not less than start time
    if (endTime != -1 && endTime < startTime) {
      throw Exception("وقت الانتهاء يجب أن يكون بعد وقت البدء");
    }

    // Find the course
    final courseField = Electrical(
      isArabic: true,
    ).allCoursesList.firstWhere((element) => element.name == courseName);

    print(extraTime);
    // Create the course duration with proper end time
    // If endTime is -1 or equals startTime, it's a single slot course
    final fieldedDuration = CourseDurationModel(
      id: cubit.state.courses.length + 1,
      course: courseField,
      start: checkTime(startTime),
      // For single slot courses, end should equal start
      end: endTime == -1 || endTime == startTime
          ? checkTime(startTime)
          : checkTime(endTime),

      day: day,
      section: hasSection
          ? CourseDurationModel(
              id: cubit.state.courses.length + 1,
              course: courseField,
              start: sectionStartTime,
              end: sectionEndTime,
              day: sectionDay ?? Days.saturday,
              extraTime: extraTime,
              extraTimeDay: extraDay ?? Days.saturday,
              
              section: null,
            )
          : null,
    );
    // Add the course
    print(fieldedDuration);
    cubit.addCourse(fieldedDuration);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تمت إضافة المادة بنجاح'),
        duration: const Duration(seconds: 2),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: $e"),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
