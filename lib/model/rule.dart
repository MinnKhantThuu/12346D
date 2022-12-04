class Rule {
  String id, title, desc, appId;
  Rule({
    required this.id,
    required this.title,
    required this.desc,
    required this.appId,
  });

  factory Rule.fromJson(dynamic json) {
    return Rule(
      id: json['_id'],
      title: json['title'],
      desc: json['desc'],
      appId: json['appId'],
    );
  }
}
