// models/course.dart
import 'package:equatable/equatable.dart';
import 'package:table/data/entity/course.dart';

class CourseDuration extends Equatable {
  final int id;
  final Course course;
  final int start;
  final int end;
  final int extraTime;
  final String day;
  final CourseDuration? section;

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

  CourseDuration copyWith({
    int? id,
    Course? course,
    int? start,
    int? end,
    int? extraTime,
    double? units,
    String? day,
    CourseDuration? section,
  }) {
    return CourseDuration(
      id: id ?? this.id,
      course: course ?? this.course,
      start: start ?? this.start,
      end: end ?? this.end,
      extraTime: extraTime ?? this.extraTime,
      day: day ?? this.day,
      section: section ?? this.section,
    );
  }
}

