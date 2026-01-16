// course_form_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/courseField/course_event.dart';
import 'package:table/bloc/courseField/course_state.dart';
import 'package:table/entity/course_duration_model.dart';

class CourseFormBloc extends Bloc<CourseFormEvent, CourseFormState> {
  CourseFormBloc() : super(CourseFormState.initial()) {
    on<ChangeDayEvent>(_onChangeDay);
    on<ClearTextFieldEvent>(_onClearTextField);
    on<ToggleCheckboxEvent>(_onToggleCheckbox);
    on<ResetFormEvent>(_onResetForm);
    on<SelectCourseName>(_onSelectCourseName);
    on<AddFormEvent>(_addFormEvent);
    on<ChangeTimeEvent>(_changeTimeEvent);
  }

  void _onChangeDay(ChangeDayEvent event, Emitter<CourseFormState> emit) {
    event.sectionDay
        ? emit(state.copyWith(sectionDay: event.newDay))
        : emit(state.copyWith(day: event.newDay));
  }

  void _onClearTextField(
    ClearTextFieldEvent event,
    Emitter<CourseFormState> emit,
  ) {
    emit(state.copyWith(course: null));
  }

  void _onToggleCheckbox(
    ToggleCheckboxEvent event,
    Emitter<CourseFormState> emit,
  ) {
    emit(state.copyWith(hasSection: !state.hasSection));
  }

  void _onResetForm(ResetFormEvent event, Emitter<CourseFormState> emit) {
    emit(CourseFormState.initial()); // Reset to initial state
  }

  void _onSelectCourseName(
    SelectCourseName event,
    Emitter<CourseFormState> emit,
  ) {
    emit(state.copyWith(course: event.course));
  }

  void _addFormEvent(AddFormEvent event, Emitter<CourseFormState> emit) {
    emit(
      CourseFormState(
        id: event.addFormState.id,
        lecture: CourseDurationModel(
          id: event.addFormState.id,
          day: event.addFormState.lecture.day,
          start: event.addFormState.lecture.start,
          end: event.addFormState.lecture.end,
          course: event.addFormState.lecture.course,
          section: event.addFormState.lecture.section != null
              ? CourseDurationModel(
                  id: event.addFormState.id,
                  course: event.addFormState.lecture.course,

                  day: event.addFormState.lecture.section!.day,
                  start: event.addFormState.lecture.section!.start,
                  end: event.addFormState.lecture.section!.end,
                  section: null,
                )
              : null,
        ),

        hasSection: event.addFormState.lecture.section != null,
      ),
    );
  }

  void _changeTimeEvent(ChangeTimeEvent event, Emitter<CourseFormState> emit) {
    
    emit(
      state.copyWith(
        start: event.start ?? state.lecture.start,
        end: event.end ?? state.lecture.end,
        sectionStart: event.sectionStart ?? (state.lecture.section != null? state.lecture.section!.start : 0),
        sectionEnd: event.sectionEnd ?? (state.lecture.section != null? state.lecture.section!.end : 0),
      ),
    );
  }
}
