import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../courseDetails/course_details_screen.dart';
import '../domain/course.dart';

class ListCourses extends StatelessWidget {
  
  ListCourses({this.courses});
  final courses;

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, rowNumber) {
        
        // if (rowNumber.isOdd) return Divider();
        
        return GestureDetector(
          onTap: (){
            var course = courses[rowNumber];
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CourseDetailsScreen(course.id, course.title)),
            );
          },
          child: Container (
            padding: EdgeInsets.all(8.0),
            child: _row(courses[rowNumber], screenSize)
          )
        );
      },
    );
  }
  Widget _row(Course course, Size screenSize) => Column(
      children: [
        Image.network(course.photo,width: screenSize.width),
        Container(height: 8.0),
        Text(course.title)
      ],
    );
}