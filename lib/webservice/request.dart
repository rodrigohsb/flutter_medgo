import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String server = "http://zuul.nesic.me/medbackend";

T decode<T>(dynamic response) => json.decode(response);

Future<Map<String, dynamic>> fetchDetails(int courseId, String authorization) async {
  String path = "coursedetails/${courseId.toString()}";
  return makeGet<Map<String, dynamic>>(path, authorization);
}

Future<List<dynamic>> retrieveCourses(String authorization) async {
  String path = "home";
  return makeGet<List<dynamic>>(path, authorization);
}

Future<List<dynamic>> fetchLessons(int courseId, String authorization) async {
  String path = "courses/${courseId.toString()}/lessons";
  return makeGet<List<dynamic>>(path, authorization);
}

Future<T> makeGet<T>(String path, String authorization) async {
  String url = "$server/$path";

  final response = await http.get(
    Uri.encodeFull(url),
    headers: {HttpHeaders.AUTHORIZATION: authorization},
  ).catchError((error){
      print(error);
  }).whenComplete((){
    print("completed");
  });

  String body = utf8.decode(response.bodyBytes);
  print("==========================================================================================");
  print("[API] statusCode = ${response.statusCode}");
  print("[API] url = $url");
  print("[API] body = $body");
  print("==========================================================================================");
  return decode<T>(body);
}