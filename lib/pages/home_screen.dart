import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/languageCubit/lang_cubit.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/bloc/tableCubit/course_cubit_state.dart';
import 'package:table/widgets/CourseField/course_field.dart';
import 'package:table/widgets/lang_check_box.dart';
import 'package:table/widgets/my_table.dart';
import 'package:table/widgets/json_button.dart';
import 'package:table/widgets/print_button.dart';
import 'package:table/widgets/share_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final CoursesCubit cubit = BlocProvider.of<CoursesCubit>(context);
    final CourseFormBloc bloc = BlocProvider.of<CourseFormBloc>(context);
    final LangCubit lang = BlocProvider.of<LangCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("انشاء الجداول"),

              //icon button with circle white background for print
              Row(
                children: [
                  ShareButton(cubit: cubit),
                  SizedBox(width: 10,),
                  JsonButton(cubit: cubit),
                  SizedBox(width: 10,),
                  PdfPrintButton(cubit: cubit)
                ],
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Card with 4 text fields
                  CourseField(cubit: cubit, bloc: bloc),
                  BlocBuilder<LangCubit, bool>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          LangCheckBox(lang: lang),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: MyTable(
                              cubit: cubit,
                              bloc: bloc,
                              lang: lang,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

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
