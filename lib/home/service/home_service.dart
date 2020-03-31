import '../../domain/course.dart';
import '../../domain/module.dart';
import 'dart:async';
import '../../webservice/request.dart';
import '../../service/auth_service.dart';

class HomeService {

  Future<List<Module>> fetchCourses() async {
    final token = await fetchAccessToken();
    final response = await retrieveCourses(token);
    return _convertToModule(response);
  }

  List<Module> _convertToModule(List<dynamic> responseJson) => 
    Course.fromJson(responseJson[0]).modules;
}