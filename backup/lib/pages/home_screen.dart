import 'package:flutter/material.dart';
import 'package:table/widgets/course_field.dart';
import 'package:table/widgets/my_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("انشاء الجداول"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Card with 4 text fields
              CourseField(),

              Container(
                margin: EdgeInsets.all(8),
                child: MyTable()),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

}