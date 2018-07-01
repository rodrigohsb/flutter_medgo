import 'dart:async';
import 'request.dart';

Future<Map<String, dynamic>> fetchDetails(int courseId, String authorization) async {
  String path = "coursedetails/${courseId.toString()}";
  return makeGet<Map<String, dynamic>>(path, authorization);
}
