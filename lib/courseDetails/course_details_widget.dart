import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/course_details.dart';
import 'list_course_details.dart';
import 'service/course_details_service.dart';

class CourseDetailsWidget extends StatelessWidget {
  CourseDetailsWidget(this.courseId);

  final courseId;

  final courseDetailsService = CourseDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseDetails>(
        future: courseDetailsService.retrieveDetails(courseId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListCourseDetails(courseDetails: snapshot.data);
          } 
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
