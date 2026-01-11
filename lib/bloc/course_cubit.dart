// cubit/courses_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/course_state.dart';
import 'package:table/entity/course_duration.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(const CoursesInitState());

  // Add course - FIXED: set the new course as selectedCourse
  void addCourse(CourseDuration course) {
    final updatedCourses = List<CourseDuration>.from(state.courses)..add(course);
    emit(CoursesState(
      courses: updatedCourses,
      selectedCourse: course, // ← This sets the newly added course as selected
    ));
  }

  void selectCourse(CourseDuration? course) {
    emit(CoursesState(
      courses: state.courses,
      selectedCourse: course,
    ));
  }

  void addSection(CourseDuration course) {
    final updatedCourses = List<CourseDuration>.from(state.courses);
    updatedCourses.removeWhere((element) => element.id == course.id);
    updatedCourses.add(course);
    emit(CoursesState(
      courses: updatedCourses,
      selectedCourse: course,
    ));
  }

  void removeSelectedCourse() {
    emit(CoursesState(
      courses: state.courses,
      selectedCourse: null,
    ));
  }
}