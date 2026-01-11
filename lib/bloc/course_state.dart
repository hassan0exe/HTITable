// cubit/courses_state.dart
import 'package:equatable/equatable.dart';
import 'package:table/entity/course_duration.dart';

class CoursesState extends Equatable {
  final List<CourseDuration> courses;
  final CourseDuration? selectedCourse;
  const CoursesState({required this.courses , this.selectedCourse});

  @override
  List<Object?> get props => [courses , selectedCourse];
}

class CoursesInitState extends CoursesState {
  const CoursesInitState({super.courses = const [] , super.selectedCourse});
}
