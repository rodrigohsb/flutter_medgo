class Owner {
  final String name;
  final String profession;
  final String picture;
  final String briefing;

  Owner.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      profession = json['profession'],
      picture = json['picture'],
      briefing = json['briefing'];
}