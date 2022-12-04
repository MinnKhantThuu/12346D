class Bank {
  String id, appId, name, accono, phone;
  Bank({
    required this.id,
    required this.appId,
    required this.name,
    required this.accono,
    required this.phone,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['_id'],
      appId: json['appId'],
      name: json['name'],
      accono: json['accono'],
      phone: json['phone'],
    );
  }
}
