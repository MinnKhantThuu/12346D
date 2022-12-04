class Ballone {
  String id,
      appId,
      leagueName,
      leagueLogo,
      matchId,
      matchTime,
      homeTeamName,
      awayTeamName,
      homeTeamLogo,
      awayTeamLogo,
      hdpOddShow,
      ouOddShow;
  int leagueId;
  double hdpHome, hdpAway, ouOver, ouUnder;
  bool isHome, isWin, isSetWinLoose;
  bool homeSelected = false;
  bool awaySelected = false;
  bool overSelected = false;
  bool underSelected = false;
  Ballone({
    required this.id,
    required this.appId,
    required this.leagueName,
    required this.leagueId,
    required this.leagueLogo,
    required this.matchId,
    required this.matchTime,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.hdpOddShow,
    required this.ouOddShow,
    required this.hdpHome,
    required this.hdpAway,
    required this.ouOver,
    required this.ouUnder,
    required this.isHome,
    required this.isWin,
    required this.isSetWinLoose,
  });

  resetSelect() {
    homeSelected = false;
    awaySelected = false;
    overSelected = false;
    underSelected = false;
  }

  factory Ballone.fromJson(dynamic json) {
    return Ballone(
      id: json['_id'],
      appId: json['appId'],
      leagueName: json['leagueName'],
      leagueId: json['leagueId'],
      leagueLogo: json['leagueLogo'],
      matchId: json['matchId'],
      matchTime: json['matchTime'],
      homeTeamName: json['homeTeamName'],
      awayTeamName: json['awayTeamName'],
      homeTeamLogo: json['homeTeamLogo'],
      awayTeamLogo: json['awayTeamLogo'],
      hdpOddShow: json['hdpOddShow'],
      ouOddShow: json['ouOddShow'],
      hdpHome: json['hdpHome'],
      hdpAway: json['hdpAway'],
      ouOver: json['ouOver'],
      ouUnder: json['ouUnder'],
      isHome: json['isHome'],
      isWin: json['isWin'],
      isSetWinLoose: json['isSetWinLoose'],
    );
  }
}
