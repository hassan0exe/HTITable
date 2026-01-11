import 'package:flutter/material.dart';
import 'package:table/data/departments/electrical.dart';
import 'package:table/data/entity/course.dart';

abstract class Department {
  String get name;
  String get code;
  Map<String, dynamic> toJson();
  Map<String, Map<List<Course>, int>> get allCoursesMap;
  List<Course> get allCoursesList ;
  Map<String, List<Course>> get departmentTree ;

  factory Department.fromJson(dynamic type) {
    final name = type is Map<String, dynamic> ? type['name'] : type;

    if (name == Electrical().toString()) {
      return Electrical();
    }
    debugPrint('getDepartment : Did not find the department');
    return Electrical();
  }

  @override
  String toString() {
    return name;
  }
}
