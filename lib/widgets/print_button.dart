
import 'package:flutter/material.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/core/utils/url.dart';
import 'package:table/data/source/store.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({
    super.key,
    required this.cubit,
  });

  final CoursesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //show pop up dialog contains text area and button 
           editBrowserUrl(Store.coursesJson(cubit.state.courses));    
      },
      icon: const Icon(
        Icons.print,
        color: Colors.blueAccent,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }
}
