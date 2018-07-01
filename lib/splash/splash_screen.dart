import 'package:flutter/material.dart';
import 'dart:async';
import '../login/login_screen.dart';
import '../home/home_screen.dart';
import '../service/SharedPreferencesService.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _sharedPreferencesService = SharedPreferencesService();

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    
    var widget;

    final bool hasAccessToken = await _hasAccessToken();

    if(hasAccessToken) {
      widget = HomeScreen();
    } else{
      widget = LoginScreen();
    }

    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<bool> _hasAccessToken() async {
    String token = await _sharedPreferencesService.recoverString("FB_TOKEN");
    return token != null;
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/medgo.png'),
      ),
    );
  }
}