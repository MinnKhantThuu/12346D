class Setting {
  String id, appVersion, homeMarquee, largerMarquee, cusNumber, appId;
  Setting({
    required this.id,
    required this.appVersion,
    required this.homeMarquee,
    required this.largerMarquee,
    required this.cusNumber,
    required this.appId,
  });

  factory Setting.fromJson(dynamic json) {
    return Setting(
      id: json['_id'],
      appVersion: json['appVersion'],
      homeMarquee: json['homeMarquee'],
      largerMarquee: json['largerMarquee'],
      cusNumber: json['cusNumber'],
      appId: json['appId'],
    );
  }
}
