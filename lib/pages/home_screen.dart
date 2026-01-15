import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/bloc/tableCubit/course_cubit_state.dart';
import 'package:table/widgets/CourseField/course_field.dart';
import 'package:table/widgets/my_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final CoursesCubit cubit = BlocProvider.of<CoursesCubit>(context);
      final CourseFormBloc bloc = BlocProvider.of<CourseFormBloc>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("انشاء الجداول"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Card with 4 text fields
                  CourseField(cubit : cubit , bloc: bloc,),

                  Container(margin: EdgeInsets.all(8), child: MyTable(cubit: cubit,bloc : bloc)),

                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
