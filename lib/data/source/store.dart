import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:table/entity/course_duration_model.dart';

class Store {
  static String coursesJson(List<CourseDurationModel> courses) {
    List<Map<String, dynamic>> json = courses.map((e) => e.toJson()).toList();
    return jsonEncode(json);
  }

  static Future<bool> saveCourses(List<CourseDurationModel> courses) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String value = coursesJson(courses);
      return await prefs.setString("courses", value);
    } catch (e) {
      print('Error saving courses: $e');
      return false;
    }
  }

  static Future<List<CourseDurationModel>> loadCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString("courses");
      
      // Check if jsonString is null or empty
      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }
      
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      
      // Use .cast<Map<String, dynamic>>() to ensure proper type conversion
      final List<Map<String, dynamic>> jsonList = decodedJson
          .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
          .toList();
      
      return jsonList
          .map((json) => CourseDurationModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error loading courses: $e');
      return [];
    }
  }

  static Future<bool> removeCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove("courses");
    } catch (e) {
      print('Error removing courses: $e');
      return false;
    }
  }
}