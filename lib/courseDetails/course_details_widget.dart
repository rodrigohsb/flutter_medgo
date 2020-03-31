import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/module_details.dart';
import 'service/course_details_service.dart';
import '../moduleDetails/module_details_screen.dart';

class CourseDetailsStatefulWidget extends StatefulWidget {
  CourseDetailsStatefulWidget(this.courseId);
  final courseId;

  @override
  State<StatefulWidget> createState() => CourseDetailsWidget(this.courseId);
}

class CourseDetailsWidget extends State<CourseDetailsStatefulWidget> {
  CourseDetailsWidget(this.courseId);

  var future;

  final courseId;

  final courseDetailsService = CourseDetailsService();
  
  @override
  void initState() {
    super.initState();
    future = courseDetailsService.retrieveDetails(courseId);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("CourseDetailsWidget - snapshot.hasError");
            return Text("${snapshot.error}");
          }
          if(snapshot.hasData){
            print("CourseDetailsWidget - snapshot.hasData");
            return CourseDetails(courseDetails: snapshot.data);
          }
          print("CourseDetailsWidget - CircularProgressIndicator");
          return Center(child: CircularProgressIndicator());
        });
  }
}

class CourseDetails extends StatelessWidget {
  
  CourseDetails({this.courseDetails});
  
  final ModuleDetails courseDetails;
  
  @override
  Widget build(BuildContext context) {

    var teacher = Card (
      child: Container (
        margin: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 70.0,
                height: 70.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(courseDetails.owner.picture)
                  )
                )
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child:  Text("Prof(a) ${courseDetails.owner.name}", style: Theme.of(context).textTheme.body1
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child:  Text("${courseDetails.owner.name}", style: Theme.of(context).textTheme.caption),
                ),
              ],
            ),
          ],
        ),
      )
    );

    var lessons = Expanded(
      child: ListView.builder(
      itemCount: courseDetails.lessons.length,
      itemBuilder: (context, rowNumber) {
        return Card (
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: ListTile(
              title: Text(courseDetails.lessons[rowNumber].title),
              onTap: (){
                var lesson = courseDetails.lessons[rowNumber];
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModuleDetailsScreen(courseDetails.id, lesson.title)),
                );
              },
            )
          )
        );
      },
    )
    );

    return Column(
        children: [
          teacher,
          lessons
        ]
    );
  }
}
