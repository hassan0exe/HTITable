// In your add_course.dart file
import 'package:flutter/material.dart';
import 'package:table/bloc/course_cubit.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/entity/course_duration.dart';
import 'package:table/widgets/CourseField/check_time.dart';

void addCourse(BuildContext context, CoursesCubit cubit,
    TextEditingController courseNameController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    String day,
    bool isSection,
) {
    try {
      String name = courseNameController.text;
      int startTime = int.parse(startTimeController.text);
      int endTime = endTimeController.text.isNotEmpty
          ? int.parse(endTimeController.text)
          : 9;

      if (name.isEmpty) {
        throw Exception("اسم المادة مطلوب");
      }
      
      // Find the course
      final courseField = Electrical(
        isArabic: true,
      ).allCoursesList.firstWhere((element) => element.name == name);

      // Create the course duration
      final fieldedDuration = CourseDuration (
        id: cubit.state.courses.length + 1,
        course: courseField,
        startTime: checkTime(startTime),
        endTime: startTime == endTime ? 9 : checkTime(endTime),
        day: day,
      );

      // Add the course - this should also set it as selectedCourse
      cubit.addCourse(fieldedDuration);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('تمت إضافة المادة بنجاح'),
          duration: const Duration(seconds: 2),
        ),
      );

      // Clear the form
      courseNameController.clear();
      startTimeController.clear();
      endTimeController.clear();
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("برجاء ادخال كامل البيانات: $e"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }