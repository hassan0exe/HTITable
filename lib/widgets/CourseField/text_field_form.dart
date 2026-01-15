import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/courseField/course_event.dart';
import 'package:table/core/constants/local_text.dart';

class CoustomeTextFormField extends StatelessWidget {
  final String text;
  final CourseFormBloc bloc;
  const CoustomeTextFormField({
    super.key,
    required this.text,
    required this.endTimeController,
    required this.bloc,
  });

  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.access_time),
      ),
      controller: endTimeController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      onChanged: (value) {
        // bloc.add(
        //   //replace with switch
        //   text == 'الانتهاء'
        //       ? ChangeTimeEvent(end: int.parse(value))
        //       : ChangeTimeEvent(start: int.parse(value)),
        // );

        if(text == LocalText.start){
          bloc.add(ChangeTimeEvent(start: int.parse(value)));
        }        else if (text == LocalText.end){
          bloc.add(ChangeTimeEvent(end: int.parse(value)));
        } else if (text == LocalText.sectionStart){
          bloc.add(ChangeTimeEvent(sectionStart: int.parse(value)));
        } else if (text == LocalText.sectionEnd){
          bloc.add(ChangeTimeEvent(sectionEnd: int.parse(value)));
        }
        
      },
    );
  }
}
