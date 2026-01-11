
import 'package:table/data/entity/course.dart';

class CourseModel extends Course {
  CourseModel({
   required super.name,
   required super.id,
   required super.units,
   required super.departmentCode,
   super.electiveName,
   });


  //coursemodel from course 
  factory CourseModel.fromCourse(Course course) {
    return CourseModel(
      name: course.name,
      id: course.id,
      units: course.units,
      departmentCode: course.departmentCode,
      electiveName: course.electiveName,
    );
  }
  

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'],
      id: json['id'],
      units: json['units'],
      departmentCode: json['department'],
      electiveName: json['elective']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'units': units,
      'department': departmentCode,
      'elective': electiveName,
    };
  }
}
