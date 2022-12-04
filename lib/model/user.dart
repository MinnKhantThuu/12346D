class User {
  String id, name, appId, phone, token, creator;
  int money, role;
  User({
    required this.id,
    required this.name,
    required this.appId,
    required this.phone,
    required this.money,
    required this.role,
    required this.creator,
    required this.token,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['_id'],
      name: json['name'],
      appId: json['appId'],
      phone: json['phone'],
      money: json['money'],
      role: json['role'],
      creator: json['creator'],
      token: json['token'],
    );
  }
}
