import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  
  Future<SharedPreferences> _getInstance() async => 
      await SharedPreferences.getInstance();
  
  Future<int> recoverInt(String key) async => 
      (await _getInstance()).getInt(key);
  
  Future<bool> recoverBoolean(String key) async => 
      (await _getInstance()).getBool(key);
  
  Future<String> recoverString(String key) async => 
      (await _getInstance()).getString(key);
  
  Future<double> recoverDouble(String key) async => 
      (await _getInstance()).getDouble(key);

  Future<bool> persistString(String key, String value) async => 
      (await _getInstance()).setString(key, value);
}