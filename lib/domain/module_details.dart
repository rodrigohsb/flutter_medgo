import 'lesson.dart';
import 'owner.dart';

class ModuleDetails {
  final int id;
  final String title;
  final String photo;
  final bool isPaid;
  final int duration;
  final String preview;
  final Owner owner;
  final List<Lesson> lessons;

  ModuleDetails({this.id, this.title, this.photo, this.isPaid, this.duration, this.preview, this.owner, this.lessons});

  factory ModuleDetails.fromJson(Map<String, dynamic> json){

    List<Lesson> lessons = List<Lesson>();
    List<dynamic> jsonLessons = json['lessons'];

    lessons = jsonLessons.map((i) => Lesson.fromJson(i)).toList();
    
    var owner = Owner.fromJson(json['owner']);

    return ModuleDetails(
      id: json['id'],
      title: json['title'],
      photo: json['picture'],
      isPaid: json['paid'],
      duration: json['estimatedHours'],
      preview: json['previewUrlVideo'],
      owner: owner,
      lessons: lessons      
    );
  }
}