// models/course.dart
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String name;
  final int startTime;
  final int endTime;
  final int extraTime;
  final double units;
  final Day day;
  final Course? section;

  const Course({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.units,
    required this.day,
    this.section,
    this.extraTime = -1,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        startTime,
        endTime,
        extraTime,
        units,
        day,
        section,
      ];

  Course copyWith({
    int? id,
    String? name,
    int? startTime,
    int? endTime,
    int? extraTime,
    double? units,
    Day? day,
    Course? section,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      extraTime: extraTime ?? this.extraTime,
      units: units ?? this.units,
      day: day ?? this.day,
      section: section ?? this.section,
    );
  }
}

enum Day {
  saturday,
  sunday,
  monday,
  tuesday,
}
