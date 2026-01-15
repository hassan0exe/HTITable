// cubit/courses_state.dart
import 'package:equatable/equatable.dart';
import 'package:table/entity/course_duration.dart';

class CoursesState extends Equatable {
  final List<CourseDuration> courses;
  const CoursesState({required this.courses});

  @override
  List<Object?> get props => [courses];
}

class CoursesInitState extends CoursesState {
  const CoursesInitState({super.courses = const []});
}
