import 'package:flutter_bloc/flutter_bloc.dart';

class LangCubit extends Cubit<bool> {
  LangCubit() : super(true);
  void changeLang() {
    emit(!state);
  }
}
