import 'lesson.dart';
import 'owner.dart';

class CourseDetails {
  final int id;
  final String title;
  final String photo;

  final String difficulty;
  final bool isPaid;
  final int duration;
  final String preview;
  final bool star;
  final bool hot;

  final Owner owner;
  final List<Lesson> lessons;

  CourseDetails({this.id, this.title, this.photo, this.difficulty, this.isPaid, this.duration, this.preview, this.star, this.hot, this.owner, this.lessons});

  factory CourseDetails.fromJson(Map<String, dynamic> json){

    List<Lesson> courseDetailsLessons = [];
    var lessons = json['lessons'];

    for (var i = 0; i < lessons.length; i++) {
      var lesson = Lesson.fromJson(lessons[i]);
      courseDetailsLessons.add(lesson);
    }

    var owner = Owner.fromJson(json['owner']);

    return CourseDetails(
      id: json['id'],
      title: json['title'],
      photo: json['picture'],
      difficulty: json['difficulty'],
      isPaid: json['paid'],
      duration: json['estimatedHours'],
      preview: json['previewUrlVideo'],
      star: json['star'],
      hot: json['hot'],
      owner: owner,
      lessons: courseDetailsLessons      
    );
  }
}