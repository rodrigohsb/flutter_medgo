import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../theme/themes.dart';
import 'home_widget.dart';

const app_name = "Medgo";

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: app_name,
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      home: Scaffold(
          appBar: AppBar(
              title: Text(app_name),
              elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          body: HomeScreenStatefulWidget(),
      ));
}