// ignore_for_file: public_member_api_docs, sort_constructors_first
// course_form_event.dart
import 'package:equatable/equatable.dart';
import 'package:table/bloc/courseField/course_state.dart';
import 'package:table/data/entity/course.dart';

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

  const ChangeTimeEvent({
    this.start,
    this.end,
    this.sectionStart,
    this.sectionEnd,
  });
}

class SelectCourseName extends CourseFormEvent {
  final Course course;

  const SelectCourseName(this.course);

  @override
  List<Object> get props => [course];
}

class ChangeDayEvent extends CourseFormEvent {
  final String newDay;
  final bool sectionDay;

  const ChangeDayEvent(this.newDay , this.sectionDay);

  @override
  List<Object> get props => [newDay , sectionDay];
}

class AddFormEvent extends CourseFormEvent {
  final CourseFormState addFormState;

  const AddFormEvent({required this.addFormState});

  @override
  List<Object> get props => [addFormState];
}
