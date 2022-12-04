class Slip {
  String id, userId, lagerId, appId, type, pId;
  int total;
  List<Bets> bets;
  Slip({
    required this.id,
    required this.userId,
    required this.lagerId,
    required this.total,
    required this.appId,
    required this.type,
    required this.pId,
    required this.bets,
  });

  factory Slip.fromJson(dynamic json) {
    List b = json['bets'] as List;
    List<Bets> bets = b.map((bet) => Bets.fromJson(bet)).toList();
    return Slip(
      id: json['_id'],
      userId: json['userId'],
      lagerId: json['lagerId'],
      total: json['total'],
      appId: json['appId'],
      type: json['type'],
      pId: json['pId'],
      bets: bets,
    );
  }
}

class Bets {
  String num;
  int amount;
  Bets({
    required this.num,
    required this.amount,
  });

  factory Bets.fromJson(dynamic json) {
    return Bets(
      num: json['num'],
      amount: json['amount'],
    );
  }
}
// {
//             "_id": "632377bb805f4e29d7a693de",
//             "userId": "631796369caca8a7bf2dafbe",
//             "lagerId": "631eb85892b426d11a34bd1a",
//             "bets": [
//                 {
//                     "num": "25",
//                     "amount": 100
//                 },
//                 {
//                     "num": "26",
//                     "amount": 100
//                 },
//                 {
//                     "num": "27",
//                     "amount": 100
//                 }
//             ],
//             "total": 300,
//             "appId": "KO2",
//             "type": "2D",
//             "pId": "AM",
//             "created": "2022-09-15T19:06:35.788Z"
//         }
