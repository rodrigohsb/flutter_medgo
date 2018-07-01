import 'dart:async';
import 'decode.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String server = "http://private-4f682-medgo.apiary-mock.com";

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
  print("[API] statusCode = ${response.statusCode}");
  print("[API] url = $url");
  print("[API] body = $body");
  return decode<T>(body);
}
