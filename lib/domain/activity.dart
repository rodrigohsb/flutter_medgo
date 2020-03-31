class Activity {
  final int id;
  final String title;
  final String content;
  final Type type;

  Activity({this.id, this.title, this.content, this.type});

  factory Activity.fromJson(Map<String, dynamic> json){

    var type = Type.fromJson(json['type']);
    
    return Activity(
    id: json['id'],
    title: json['title'],
    content: json['content'],
    type: type);
  }
}

class Type {
  final int id;
  final String content;

  Type.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      content = json['content'];
}