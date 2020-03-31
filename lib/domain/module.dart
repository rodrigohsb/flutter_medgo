class Module {
  final int id;
  final String title;
  final String picture;

  Module({this.id, this.title,this.picture});
  
  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      picture: json['picture']);
  }
}