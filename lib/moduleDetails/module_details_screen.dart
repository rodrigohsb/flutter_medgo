import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'module_details_widget.dart';

class ModuleDetailsScreen extends StatelessWidget {
  ModuleDetailsScreen(this.courseId, this.moduleTitle);

  final courseId;
  final moduleTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(moduleTitle,
          style: Theme
              .of(context)
              .textTheme
              .subhead
              .apply(color: Colors.white)),
      elevation:
      Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),
    body: ModuleDetailsStatefulWidget(courseId),
  );
}
