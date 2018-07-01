import 'dart:async';
import 'SharedPreferencesService.dart';

class AuthService {
  
  final _sharedPreferencesService = SharedPreferencesService();

  Future<String> fetchAccessToken() async => 
      await _sharedPreferencesService.recoverString("FB_TOKEN");
}