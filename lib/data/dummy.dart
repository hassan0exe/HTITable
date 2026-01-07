import 'package:table/entity/course.dart';

List<Course> courses = [
  Course(
    id: 0,
    name: "test1",
    startTime: 1,
    endTime: 3,
    units: 3,
    day: Day.saturday,
  ),
  Course(
    id: 1,
    name: "test2",
    startTime: 5,
    endTime: 6,
    units: 3,
    day: Day.saturday,
    section: Course(
      id: 2,
      name: "test2 section",
      startTime: 7,
      endTime: 0,
      units: 0,
      day: Day.tuesday,
    ),
  ),
];
