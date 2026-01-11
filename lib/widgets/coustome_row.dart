import 'package:flutter/material.dart';
import 'package:table/bloc/course_cubit.dart';
import 'package:table/entity/course_duration.dart';
List<TableRow> coustomeRow({
  required List<String> heads,
  required CoursesCubit cubit,
  Color? headBackgroundColor,
  Color? backgroundColor,
  List<String>? data,
  double cellHeight = 80,
  double padding = 8,
  double dataFontSize = -1,
  double headFontSize = 14,
}) {
  return heads.map((head) {
    // Get all courses that have either main lecture OR section on this day
    List<CourseDuration> courses = cubit.state.courses.where((element) {
      return element.day == head || 
             (element.section != null && element.section!.day == head);
    }).toList();
    
    // Calculate dynamic height based on number of courses
    int totalCourseCount = courses.length;
    double dataCellHeight = totalCourseCount > 0
        ? cellHeight * (totalCourseCount + 1) * 0.8
        : cellHeight;
    
    return TableRow(
      children: [
        // First cell (head cell)
        TableCell(
          child: Container(
            color: headBackgroundColor,
            height: dataCellHeight,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Text(
                  head,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: headFontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Data cells
        ...List.generate(8, (index) {
          return TableCell(
            child: SizedBox(
              height: dataCellHeight,
              child: Center(
                child: Text(
                  data != null && index < data.length
                      ? data[index]
                      : stackCourses(courses, index + 1, head),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: dataFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }).toList();
}

String stackCourses(
  List<CourseDuration> courses,
  int currentIndex,
  String head,
) {
  List<String> items = [];

  for (CourseDuration courseDuration in courses) {
    // Check main course
    if (courseDuration.day == head &&
        courseDuration.startTime <= currentIndex &&
        courseDuration.endTime >= currentIndex) {
      String name = courseDuration.course.name;
      if (name.length > 15) name = "${name.substring(0, 12)}...";
      items.add(name);
    }
    
    // Check section
    if (courseDuration.section != null &&
        courseDuration.section!.day == head &&
        courseDuration.section!.startTime <= currentIndex &&
        courseDuration.section!.endTime >= currentIndex) {
      String name = courseDuration.section!.course.name;
      if (name.length > 13) name = "${name.substring(0, 10)}...";
      items.add("سكشن $name");
    }
  }
  
  return items.join("\n\n");
}