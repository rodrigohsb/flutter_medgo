import 'dart:async';
import 'request.dart';

Future<List<dynamic>> retrieveCourses(String authorization) async {
  String path = "courses";
  return makeGet<List<dynamic>>(path, authorization);
}
