import 'package:flutter/material.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/data/source/store.dart';

class JsonButton extends StatelessWidget {
  const JsonButton({
    super.key,
    required this.cubit,
  });

  final CoursesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //show pop up dialog contains text area and button 
        showDialog(
  context: context,
  builder: (BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    titleController.text = Store.coursesJson(cubit.state.courses) == '[]' ? '' : Store.coursesJson(cubit.state.courses);
    
    return AlertDialog(
      title: const Text("الجدول JSON ادخل"),
      content: SizedBox(
        width: double.maxFinite,
        child: TextFormField(
          controller: titleController,
          maxLines: null, // Allows unlimited lines
          minLines: 6, // Shows at least 6 lines initially
          keyboardType: TextInputType.multiline,
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(
            hintText: "JSON الجدول",
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.all(12),
            filled: true,
            fillColor: Color(0xFFF9F9F9),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            cubit.loadCoursesFromPrint(titleController.text);
            Navigator.of(context).pop();
          },
          child: const Text("تنفيذ"),
        ),
      ],
    );
  },
);
    
      },
      icon: const Icon(
        Icons.data_array,
        color: Colors.blueAccent,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }
}