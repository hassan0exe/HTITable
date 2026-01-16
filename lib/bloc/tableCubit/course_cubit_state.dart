// cubit/courses_state.dart
import 'package:equatable/equatable.dart';
import 'package:table/entity/course_duration_model.dart';

class CoursesState extends Equatable {
  final List<CourseDurationModel> courses;
  const CoursesState({required this.courses});

  @override
  List<Object?> get props => [courses];
}

class CoursesInitState extends CoursesState {
  const CoursesInitState({required super.courses});
}
