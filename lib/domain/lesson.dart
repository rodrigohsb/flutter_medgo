class Lesson {
  final int id;
  final String title;
  final int duration;
  final int courseId;

  Lesson.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      duration = json['duration'],
      courseId = json['courseId'];
}