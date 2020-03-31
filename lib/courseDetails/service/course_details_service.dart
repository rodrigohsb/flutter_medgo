import '../../domain/module_details.dart';
import 'dart:async';
import '../../webservice/request.dart';
import '../../service/auth_service.dart';

class CourseDetailsService {

  Future<ModuleDetails> retrieveDetails(int id) async {
    final token = await fetchAccessToken();
    var response = await fetchDetails(id, token);
    return _convertToCourseDetails(response);
  }

  ModuleDetails _convertToCourseDetails(Map<String, dynamic> responseJson) => 
    ModuleDetails.fromJson(responseJson);
}