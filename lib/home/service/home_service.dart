import '../../domain/course.dart';
import '../../domain/module.dart';
import 'dart:async';
import '../../webservice/fetch_courses.dart';
import '../../service/AuthService.dart';

class HomeService {

  final authService = AuthService();
  
  Future<List<Course>> fetchCourses() async {

    final accessToken = await authService.fetchAccessToken();
    final token = "Bearer $accessToken";

    final response = await retrieveCourses(token);
    return _convertToModule(response);
  }

  List<Course> _convertToModule(List<dynamic> responseJson) => 
    Module.fromJson(responseJson[0]).courses;
}