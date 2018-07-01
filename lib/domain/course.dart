class Course {
  final int id;
  final String title;
  final String photo;

  Course.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      photo = json['picture'];
}