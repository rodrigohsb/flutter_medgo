import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/module.dart';
import 'service/home_service.dart';
import '../courseDetails/course_details_screen.dart';

class HomeScreenStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => HomeWidget();
}

class HomeWidget extends State<HomeScreenStatefulWidget> {

  var future;

  final homeService = HomeService();

  @override
  void initState() {
    super.initState();
    future = homeService.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("HomeWidget - snapshot.hasError");
            return Text("${snapshot.error}");
          }
          if(snapshot.hasData){
            print("HomeWidget - snapshot.hasData");
            return ListCourses(courses: snapshot.data);
          }
          print("HomeWidget - CircularProgressIndicator");
          return Center(child: CircularProgressIndicator());
        });
  }
}

class ListCourses extends StatelessWidget {
  
  ListCourses({this.courses});
  final courses;

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, rowNumber) {        
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
  Widget _row(Module module, Size screenSize) => Column(
      children: [
        Image.network(module.picture,width: screenSize.width),
        Container(height: 8.0),
        Text(module.title)
      ],
    );
}