// models/course.dart
import 'package:equatable/equatable.dart';
import 'package:table/data/entity/course_model.dart';
import 'package:table/entity/course_duration_model.dart';

class CourseDuration extends Equatable {
  final int id;
  final CourseModel course;
  final int start;
  final int end;
  final int extraTime;
  final String day;
  final CourseDurationModel? section;

  const CourseDuration({
    required this.id,
    required this.course,
    required this.start,
    required this.end,
    required this.day,
    required this.section,
    this.extraTime = -1,
  });

  @override
  List<Object?> get props => [
        id,
        course,
        start,
        end,
        extraTime,
        day,
        section,
      ];


}

