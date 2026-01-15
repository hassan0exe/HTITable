
import 'package:flutter/material.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/courseField/course_event.dart';
import 'package:table/core/constants/days.dart';
import 'package:table/core/constants/local_text.dart';
import 'package:table/widgets/CourseField/text_field_form.dart';

class SectionFormField extends StatelessWidget {
  const SectionFormField({
    super.key,
    required this.startSectionTimeController,
    required this.bloc,
    required this.endSectionTimeController,
  });

  final TextEditingController startSectionTimeController;
  final CourseFormBloc bloc;
  final TextEditingController endSectionTimeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "بيانات السكشن",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CoustomeTextFormField(
                        text: LocalText.sectionStart,
                        endTimeController: startSectionTimeController,
                        bloc: bloc,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CoustomeTextFormField(
                        text: LocalText.sectionEnd,
                        endTimeController: endSectionTimeController,
                        bloc: bloc,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue:  bloc.state.lecture.section!.day,
                  decoration: const InputDecoration(
                    labelText: "يوم السكشن",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  items: <String>[...Days.days]
                      .map<DropdownMenuItem<String>>(
                          (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      bloc.add(ChangeDayEvent(newValue , true));
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
