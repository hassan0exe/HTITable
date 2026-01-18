import 'package:flutter/material.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/courseField/course_event.dart';
import 'package:table/bloc/languageCubit/lang_cubit.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/entity/course_duration.dart';
import 'package:table/entity/course_duration_model.dart';
List<TableRow> coustomeRow({
  required List<String> heads,
  required CoursesCubit cubit,
  required CourseFormBloc bloc,
  required LangCubit lang,
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
    List<CourseDurationModel> courses = cubit.state.courses.where((element) {
      return element.day == head || 
             (element.section != null && element.section!.day == head)
             || (element.section != null && element.section!.extraTimeDay == head);
    }).toList();
    
    // Calculate dynamic height based on number of courses
    int totalCourseCount = courses.length;
    double dataCellHeight = totalCourseCount > 0
        ? cellHeight * (totalCourseCount + 1) * 0.4
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
        ...List.generate(10, (index) {
          return TableCell(
            child: InkWell(
              child: SizedBox(
                height: dataCellHeight,
                child: Center(
                  child: Text(
                    data != null && index < data.length
                        ? data[index]
                        : stackCourses(courses, index + 1, head , lang),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: dataFontSize,
                      fontWeight: FontWeight.bold,
                      color: stackCourses(courses, index + 1, head , lang).contains("\n") ? Colors.red : Colors.black
                    ),
                  ),
                ),
              ),
              onTap: ()=>selectCourse(courses: courses, currentIndex: index+1, head: head, bloc: bloc),
            ),
          );
        }),
      ],
    );
  }).toList();
}

void selectCourse({
  required List<CourseDurationModel> courses,
  required int currentIndex,
  required String head,
  required CourseFormBloc bloc,
}) {
  for (CourseDurationModel courseDuration in courses) {
    if (courseDuration.day == head &&
        courseDuration.start <= currentIndex &&
        courseDuration.end >= currentIndex) {
      
      bloc.add(AddFormEvent(
        addFormState: bloc.state.copyWith(
        lec: courseDuration,
      )));
      return;
    }
  }
        bloc.add(ResetFormEvent());

}

String stackCourses(
  List<CourseDuration> courses,
  int currentIndex,
  String head,
  LangCubit lang,
) {
  List<String> items = [];

  for (CourseDuration courseDuration in courses) {
    // Check main course
    if (courseDuration.day == head &&
        courseDuration.start <= currentIndex &&
        courseDuration.end >= currentIndex || courseDuration.end == 0) {
      String name = courseDuration.course.name;
      if (name.length > 15) name = "${name.substring(0, 12)}...";
      items.add(lang.state ?courseDuration.course.id : name);
    }
    // Check section
    if (courseDuration.section != null &&
        courseDuration.section!.day == head &&
        courseDuration.section!.start <= currentIndex &&
        courseDuration.section!.end >= currentIndex) {
      String name = courseDuration.section!.course.name;
      if (name.length > 13) name = "${name.substring(0, 10)}...";
      items.add("سكشن ${lang.state ?  courseDuration.section!.course.id : name}");
    }

    // Check extra time
    if (courseDuration.section != null &&
        courseDuration.section!.extraTimeDay == head &&
        courseDuration.section!.extraTime == currentIndex) {
      String name = courseDuration.section!.course.name;
      if (name.length > 13) name = "${name.substring(0, 10)}...";
      items.add("سكشن ${lang.state ?  courseDuration.section!.course.id : name}");
    }

  }
  
  return items.join("\n\n");
}