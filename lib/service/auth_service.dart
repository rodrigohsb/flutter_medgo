import 'dart:async';
import 'SharedPreferencesService.dart';

Future<String> _fetchAccessToken() async =>
    await SharedPreferencesService().recoverString("FB_TOKEN");

Future<String> fetchAccessToken() async {
  final accessToken = await _fetchAccessToken();
  return "Bearer $accessToken";
}