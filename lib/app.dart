import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';
import 'login/login_screen.dart';
import 'home/home_screen.dart';

class MedgoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => 
      MaterialApp(
          home: SplashScreen(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/login':
                return new MyCustomRoute(
                  builder: (_) => new LoginScreen(),
                  settings: settings,
                );

              case '/home':
                return new MyCustomRoute(
                  builder: (_) => new HomeScreen(),
                  settings: settings,
                );
            }
          },
      );
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}