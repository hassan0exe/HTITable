// cubit/courses_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/course_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(const CoursesInitState());

}
