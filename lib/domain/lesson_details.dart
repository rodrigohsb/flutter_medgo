import 'activity.dart';

class LessonDetails {
  final int id;
  final String title;
  final int duration;
  final List<Activity> activities;
  
  LessonDetails({this.id, this.title, this.duration, this.activities});

  factory LessonDetails.fromJson(Map<String, dynamic> json){

    List<Activity> activities = List<Activity>();
    List<dynamic> activitiesLessons = json['activities'];

    activities = activitiesLessons.map((i) => Activity.fromJson(i)).toList();

    return LessonDetails(
        id: json['id'],
        title: json['title'],
        duration: json['duration'],
        activities: activities);
  }
}