import 'package:table/data/entity/course_model.dart';
import 'package:table/entity/course_duration.dart';

class CourseDurationModel extends CourseDuration {
  const CourseDurationModel({
    required super.id,
    required super.course,
    required super.start,
    required super.end,
    required super.day,
    required super.section,
    super.extraTime = 0,
    super.extraTimeDay
  });

factory CourseDurationModel.fromJson(Map<String, dynamic> json) {
  // Parse course with null check
  final courseJson = json['course'];
  final CourseModel course;
  
  if (courseJson is Map<String, dynamic>) {
    course = CourseModel.fromJson(courseJson);
  } else {
    // Provide default course
    course = CourseModel(
      id: '0',
      name: 'Unknown Course',
      units: 0,
      departmentCode: '',
    );
  }
  
  // Parse section with null check
  final sectionJson = json['section'];
  final CourseDurationModel? section;
  
  if (sectionJson is Map<String, dynamic>) {
    section = CourseDurationModel.fromJson(sectionJson);
  } else {
    section = null;
  }
  
  return CourseDurationModel(
    id: json['id'] as int? ?? 0,
    course: course,
    start: json['start'] as int? ?? 0,
    end: json['end'] as int? ?? 0,
    day: json['day'] as String? ?? '',
    extraTime: json['extraTime'] as int? ?? 0,
    extraTimeDay: json['extraTimeDay'] as String?,
    section: section,

  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course': course.toJson(),
      'start': start,
      'end': end,
      'day': day,
      'section': section?.toJson(),
      'extraTime': extraTime,
      'extraTimeDay': extraTimeDay,
    };
  }
  
CourseDurationModel copyWith({
    int? id,
    CourseModel? course,
    int? start,
    int? end,
    double? units,
    String? day,
    int? extraTime,
    String? extraTimeDay,
    CourseDurationModel? section,
  }) {
    return CourseDurationModel(
      id: id ?? this.id,
      course: course ?? this.course,
      start: start ?? this.start,
      end: end ?? this.end,
      day: day ?? this.day,
      section: section ?? this.section,
      extraTime: extraTime ?? this.extraTime,
      extraTimeDay: extraTimeDay ?? this.extraTimeDay,
    );
  }
  
}
