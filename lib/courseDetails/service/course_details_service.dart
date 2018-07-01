import '../../domain/course_details.dart';
import 'dart:async';
import '../../webservice/fetch_course_details.dart';
import '../../service/AuthService.dart';

class CourseDetailsService {

  final authService = AuthService();

  Future<CourseDetails> retrieveDetails(int courseId) async {

    var accessToken = await authService.fetchAccessToken();
    var token = "Bearer $accessToken";

    var response = await fetchDetails(courseId, token);
    return _convertToCourseDetails(response);
  }

  CourseDetails _convertToCourseDetails(Map<String, dynamic> responseJson) => 
    CourseDetails.fromJson(responseJson);
}