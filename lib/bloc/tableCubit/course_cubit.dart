// cubit/courses_cubit.dart
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/tableCubit/course_cubit_state.dart';
import 'package:table/data/entity/course.dart';
import 'package:table/data/source/store.dart';
import 'package:table/entity/course_duration_model.dart';

class CoursesCubit extends Cubit<CoursesState> {
   CoursesCubit() : super(const CoursesInitState(courses: [])) {
    // Load courses asynchronously after initialization
    _loadInitialCourses();
  }

  // Load courses asynchronously
  Future<void> _loadInitialCourses() async {
    try {
      final courses = await Store.loadCourses();
      emit(CoursesState(courses: courses));
    } catch (e) {
      print('Error loading initial courses: $e');
      // Emit empty state if there's an error
      emit(CoursesState(courses: []));
    }
  }

    // Load courses from print
  void loadCoursesFromPrint(String text) {
    try {
      final decodedJson = jsonDecode(text);
    final List<Map<String, dynamic>> jsonList = decodedJson
          .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
          .toList();
          final courses = jsonList
          .map((json) => CourseDurationModel.fromJson(json))
          .toList();
      emit(CoursesState(courses: courses));
    } catch (e) {
      // print('Error loading initial courses: $e');
      // Emit empty state if there's an error
      emit(CoursesState(courses: []));
    }
  }

  // Add course - FIXED: set the new course as selectedCourse
  void addCourse(CourseDurationModel courseDuration) {
    removeSelectedCourse(courseDuration.course);
    List<CourseDurationModel> updatedCourses = List<CourseDurationModel>.from(
      state.courses,
    )..add(courseDuration);
    emit(CoursesState(courses: updatedCourses));
    
    //use future instaid of await
    Store.saveCourses(updatedCourses).then((value) {
      if (value) {
        print("courses saved");
      } else {
        print("error saving courses");
      }
    });
    
  }

  void removeAllSelectedCourse() {
    emit(CoursesState(courses: []));
    Store.removeCourses().then((value) {
      if (value) {
        print("all cleared");
      } else {
        print("error clearing the memory");
      }
    });
    
      }

  void removeSelectedCourse(Course course) {
    List<CourseDurationModel> updatedCourses = List<CourseDurationModel>.from(
      state.courses,
    );
    updatedCourses.removeWhere((element) => element.course.id == course.id);
    emit(CoursesState(courses: updatedCourses));

        //use future instaid of await
    Store.saveCourses(updatedCourses).then((value) {
      if (value) {
        print("courses Removed");
      } else {
        print("error Removing courses");
      }
    });
  }
}
