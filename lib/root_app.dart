import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/courseField/course_bloc.dart';
import 'package:table/bloc/languageCubit/lang_cubit.dart';
import 'package:table/bloc/tableCubit/course_cubit.dart';
import 'package:table/core/routes/names.dart';
import 'package:table/core/routes/pages.dart';

import 'core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => DismissKeyboard(
          child: MultiBlocProvider(
            providers: [
            BlocProvider( create: (context) => CoursesCubit()),
            BlocProvider( create: (context) => CourseFormBloc()),
            BlocProvider( create: (context) => LangCubit()),
            ],
           child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.initial,
              onGenerateRoute: AppRoute.generate,
            ),
          ),
        ),
    );
  }
}
