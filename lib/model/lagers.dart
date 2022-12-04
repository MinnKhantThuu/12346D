class Lagers {
  String id, appId, name, type;
  int payout, total;
  bool isOpen;
  Times times;
  List<Bets> bets;
  Lagers({
    required this.times,
    required this.id,
    required this.appId,
    required this.name,
    required this.type,
    required this.payout,
    required this.total,
    required this.isOpen,
    required this.bets,
  });

  factory Lagers.fromJson(dynamic json) {
    var times = Times.fromJson(json['times']);
    List bets = json['bets'] as List;
    List<Bets> b = bets
        .map(
          (e) => Bets.fromJson(e),
        )
        .toList();
    return Lagers(
      times: times,
      bets: b,
      id: json['_id'],
      appId: json['appId'],
      name: json['name'],
      type: json['type'],
      payout: json['payout'],
      total: json['total'],
      isOpen: json['isOpen'],
    );
  }
}

class Times {
  String close, resultTime, start, end;
  Times({
    required this.close,
    required this.resultTime,
    required this.start,
    required this.end,
  });

  factory Times.fromJson(dynamic json) {
    return Times(
      close: json['close'],
      resultTime: json['resultTime'],
      start: json['start'],
      end: json['end'],
    );
  }
}

class Bets {
  String num, id;
  int amount, limit;
  bool apate;
  Bets({
    required this.num,
    required this.id,
    required this.amount,
    required this.limit,
    required this.apate,
  });

  factory Bets.fromJson(dynamic json) {
    return Bets(
      num: json['num'],
      id: json['_id'],
      amount: json['amount'],
      limit: json['limit'],
      apate: json['apate'],
    );
  }
}
