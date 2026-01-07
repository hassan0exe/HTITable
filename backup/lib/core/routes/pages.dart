
    import 'package:flutter/material.dart';
import 'package:table/core/routes/names.dart';
import 'package:table/pages/home_screen.dart';
    import '../error/error.dart';

    class AppRoute {
        static const initial = RoutesName.initial;
        static Route<dynamic> generate(RouteSettings? settings) {
            switch (settings?.name) {
     
      case RoutesName.initial:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
        }
    }