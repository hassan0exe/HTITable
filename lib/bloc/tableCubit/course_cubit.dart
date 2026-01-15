// cubit/courses_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/tableCubit/course_cubit_state.dart';
import 'package:table/data/entity/course.dart';
import 'package:table/entity/course_duration.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(const CoursesInitState());

  // Add course - FIXED: set the new course as selectedCourse
  void addCourse(CourseDuration courseDuration) {
    removeSelectedCourse(courseDuration.course);
    List<CourseDuration> updatedCourses = List<CourseDuration>.from(
      state.courses,
    )..add(courseDuration);
    emit(CoursesState(courses: updatedCourses));
    // print(state.courses);
  }

  void selectCourse(CourseDuration? course) {
    emit(CoursesState(courses: state.courses));
  }

  void removeAllSelectedCourse() {
    emit(CoursesState(courses: []));
  }

  void removeSelectedCourse(Course course) {
    List<CourseDuration> updatedCourses = List<CourseDuration>.from(
      state.courses,
    );
    updatedCourses.removeWhere((element) => element.course.id == course.id);
    emit(CoursesState(courses: updatedCourses));
  }
}
