import '../../domain/lesson_details.dart';
import '../../domain/activity.dart';
import 'dart:async';
import '../../webservice/request.dart';
import '../../service/auth_service.dart';

class ModuleDetailsService {

  Future<List<Activity>> retrieveDetails(int id) async {
    final token = await fetchAccessToken();
    var response = await fetchLessons(id, token);
    return _convertToModuleDetails(response);
  }

  List<Activity> _convertToModuleDetails(List<dynamic> responseJson) =>
      LessonDetails.fromJson(responseJson[0]).activities;
}