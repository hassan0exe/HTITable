// course_form_state.dart

import 'package:equatable/equatable.dart';
import 'package:table/core/constants/days.dart';
import 'package:table/data/entity/course_model.dart';
import 'package:table/entity/course_duration_model.dart';

class CourseFormState extends Equatable {
  final int id;
  final CourseDurationModel lecture;
  final bool hasSection;

  const CourseFormState({
    this.id = 0,
    required this.lecture,
    this.hasSection = false,
  });

  factory CourseFormState.initial() {
    return CourseFormState(
      id: -2,
      lecture: CourseDurationModel(
        id: -2,
        day: Days.saturday,
        start: 0,
        end: 0,
        course: CourseModel(name: "", id: "", units: 0, departmentCode: ""),
        section:null,
      ),

      hasSection: false,
    );
  }

  CourseFormState copyWith({
    int? id,
    CourseDurationModel? lec,
    bool? hasSection,
    String? day,
    int? start,
    int? end,
    CourseModel? course,
    int? sectionStart,
    int? sectionEnd,
    int? extra,
    String? dayExtra,
    String? sectionDay,
  }) {
    return CourseFormState(
      id: id ?? this.id,
      lecture: lec ?? lecture.copyWith(
        id: id ?? this.id,
        day: day ?? lecture.day,
        start: start ?? lecture.start,
        end: end ?? lecture.end,
        course: course ?? lecture.course,
        section: CourseDurationModel(
        id: id ?? this.id,
        day: sectionDay ?? (lecture.section != null ? lecture.section!.day  : Days.saturday) ,
        start: sectionStart ?? (lecture.section != null ? lecture.section!.start : 0),
        end: sectionEnd ?? (lecture.section != null ? lecture.section!.end : 0),
        course: course ?? lecture.course,
        extraTimeDay: dayExtra ?? (lecture.section != null ? lecture.section!.extraTimeDay : Days.saturday),
        extraTime: extra ?? (lecture.section != null ? lecture.section!.extraTime : 0
        ),
        section: null
      )
      ),
      
      hasSection: hasSection ?? this.hasSection,
    );
  }

  @override
  List<Object?> get props => [
    id,
    lecture,
    lecture.section,
    hasSection == true ? "has a section" : "doesn't have a section",
  ];
}
