import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';

void main() => runApp(MedgoApp());

class MedgoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SplashScreen());
}