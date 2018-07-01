import 'course.dart';

class Module {
  final int id;
  final String title;
  final List<Course> courses;

  Module({this.id, this.title, this.courses});
  
  factory Module.fromJson(Map<String, dynamic> json) {

    List<Course> moduleCourses = [];
    var courses = json['courses'];
  
    for (var i = 0; i < courses.length; i++) {
      var course = Course.fromJson(courses[i]);
      moduleCourses.add(course);
    }

    return Module(
      id: json['id'],
      title: json['title'],
      courses: moduleCourses);
  }
}