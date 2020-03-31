import 'module.dart';

class Course {
  final int id;
  final String title;
  final List<Module> modules;

  Course({this.id, this.title, this.modules});
  
  factory Course.fromJson(Map<String, dynamic> json) {

    List<Module> modules = List<Module>();
    List<dynamic> modulesJson = json['courses'];

    modules = modulesJson.map((i) => Module.fromJson(i)).toList();
    
    return Course(
      id: json['id'],
      title: json['title'],
      modules: modules);
  }
}