// models/course.dart
import 'package:equatable/equatable.dart';
import 'package:table/data/entity/course.dart';

class CourseDuration extends Equatable {
  final int id;
  final Course course;
  final int startTime;
  final int endTime;
  final int extraTime;
  final String day;
  final CourseDuration? section;

  const CourseDuration({
    required this.id,
    required this.course,
    required this.startTime,
    required this.endTime,
    required this.day,
    this.section,
    this.extraTime = -1,
  });

  @override
  List<Object?> get props => [
        id,
        course,
        startTime,
        endTime,
        extraTime,
        day,
        section,
      ];

  CourseDuration copyWith({
    int? id,
    Course? course,
    int? startTime,
    int? endTime,
    int? extraTime,
    double? units,
    String? day,
    CourseDuration? section,
  }) {
    return CourseDuration(
      id: id ?? this.id,
      course: course ?? this.course,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      extraTime: extraTime ?? this.extraTime,
      day: day ?? this.day,
      section: section ?? this.section,
    );
  }
}

