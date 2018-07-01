import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/course_details.dart';

class ListCourseDetails extends StatelessWidget {
  
  ListCourseDetails({this.courseDetails});
  
  final CourseDetails courseDetails;
  
  @override
  Widget build(BuildContext context) {
    var list = Expanded(
      child: ListView.builder(
      itemCount: courseDetails.lessons.length,
      itemBuilder: (context, rowNumber) {
        return Card (
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: ListTile(
              title: Text(courseDetails.lessons[rowNumber].title),
            )
          )
        );
      },
    )
    );

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
                  child:  Text("${courseDetails.owner.briefing}", style: Theme.of(context).textTheme.caption),
                ),
              ],
            ),
          ],
        ),
      )
    );

    return Column(
        children: [
          teacher,
          list
        ]
    );
  }
}
