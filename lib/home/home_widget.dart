import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../domain/course.dart';
import 'list_courses.dart';
import 'service/home_service.dart';

class HomeWidget extends StatelessWidget {
  
  final homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: homeService.fetchCourses(),
        builder: (context, snapshot) {
          
          if (snapshot.hasError) return Text("${snapshot.error}");

          return snapshot.hasData
          ? ListCourses(courses: snapshot.data)
          : Center(child: CircularProgressIndicator());
        });
  }
}