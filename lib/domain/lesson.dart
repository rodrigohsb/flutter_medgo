class Lesson {
  final int id;
  final String title;
  final int duration;
  final bool hasUpdate;
  
  Lesson({this.id, this.title, this.duration, this.hasUpdate});

  factory Lesson.fromJson(Map<String, dynamic> json){

    return Lesson(
        id: json['id'],
        title: json['title'],
        duration: json['duration'],
        hasUpdate: json['hasUpdate']);
  }
}