// ignore_for_file: public_member_api_docs, sort_constructors_first
// course_form_event.dart
import 'package:equatable/equatable.dart';
import 'package:table/bloc/courseField/course_state.dart';
import 'package:table/data/entity/course_model.dart';

abstract class CourseFormEvent extends Equatable {
  const CourseFormEvent();

  @override
  List<Object> get props => [];
}

class ClearTextFieldEvent extends CourseFormEvent {}

class ToggleCheckboxEvent extends CourseFormEvent {
  final bool checkBox;
  const ToggleCheckboxEvent({this.checkBox = false});
}

class ResetFormEvent extends CourseFormEvent {}

class ChangeTimeEvent extends CourseFormEvent {
  final int? start;
  final int? end;
  final int? sectionStart;
  final int? sectionEnd;
  final int? extra;
  
  const ChangeTimeEvent({
    this.start,
    this.end,
    this.sectionStart,
    this.sectionEnd,
    this.extra,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
    start ?? 0,
    end ?? 0,
    sectionStart ?? 0,
    sectionEnd ?? 0,
  ];

  @override
  String toString() {
    return 'ChangeTimeEvent(start: $start, end: $end, sectionStart: $sectionStart, sectionEnd: $sectionEnd)';
  }
  
}

class SelectCourseName extends CourseFormEvent {
  final CourseModel course;

  const SelectCourseName(this.course);

  @override
  List<Object> get props => [course];
}

class ChangeDayEvent extends CourseFormEvent {
  final String newDay;
  final String type;

  const ChangeDayEvent(this.newDay, this.type);

  @override
  List<Object> get props => [newDay, type];
}

class AddFormEvent extends CourseFormEvent {
  final CourseFormState addFormState;

  const AddFormEvent({required this.addFormState});

  @override
  List<Object> get props => [addFormState];
}
