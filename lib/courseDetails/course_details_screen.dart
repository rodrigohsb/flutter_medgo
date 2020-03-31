import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'course_details_widget.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen(this.courseId, this.title);

  final courseId;
  final title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title,
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .apply(color: Colors.black)),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: CourseDetailsStatefulWidget(courseId),
      );
}
