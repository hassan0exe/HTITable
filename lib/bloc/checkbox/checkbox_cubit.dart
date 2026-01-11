// cubit/checkbox_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);

  void toggle() => emit(!state);
  void setValue(bool value) => emit(value);
}