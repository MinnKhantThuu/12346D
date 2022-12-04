import 'dart:convert';

import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/ballone.dart';

class BalloneProvider with ChangeNotifier {
  List<Ballone> _body = [];
  List<Ballone> _moung = [];
  List<int> _bLeagueId = [];
  List<List<Ballone>> _bTeamList = [];
  List<int> _mgLeagueId = [];
  List<List<Ballone>> _mgTeamList = [];
  bool _bodyErr = false;
  String _bodyErrMsg = '';
  bool _moungErr = false;
  String _mounErrMsg = '';

  List<Ballone> get body => _body;
  List<Ballone> get moung => _moung;
  List<List<Ballone>> get bTeamList => _bTeamList;
  List<List<Ballone>> get mgTeamList => _mgTeamList;
  bool get bodyErr => _bodyErr;
  bool get moungErr => _moungErr;
  String get bodyErrMsg => _bodyErrMsg;
  String get moungErrMsg => _mounErrMsg;

  _setBody(List<Ballone> body) {
    _body = body;
    body.forEach((b) {
      _bLeagueId.add(b.leagueId);
      _bLeagueId = _bLeagueId.toSet().toList();
    });
    _bLeagueId.forEach((lId) {
      List<Ballone> tempList = [];
      body.forEach((bdy) {
        if (lId == bdy.leagueId) {
          tempList.add(bdy);
          tempList = tempList.toSet().toList();
        }
      });
      _bTeamList.add(tempList);
      _bTeamList = _bTeamList.toSet().toList();
      // print(teamList);
    });
  }

  _setMoung(List<Ballone> moung) {
    _moung = moung;
    moung.forEach((mg) {
      _mgLeagueId.add(mg.leagueId);
      _mgLeagueId = _mgLeagueId.toSet().toList();
    });
    _mgLeagueId.forEach((lId) {
      List<Ballone> tempList = [];
      moung.forEach((mg) {
        if (lId == mg.leagueId) {
          tempList.add(mg);
          tempList = tempList.toSet().toList();
        }
      });
      _mgTeamList.add(tempList);
      _mgTeamList = _mgTeamList.toSet().toList();
      // print(teamList);
    });
  }

  _setBodyError(bool err, String errMsg) {
    _bodyErr = err;
    _bodyErrMsg = errMsg;
  }

  _setMoungError(bool err, String errMsg) {
    _moungErr = err;
    _mounErrMsg = errMsg;
  }

  getBody({
    required String token,
  }) async {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var json = jsonEncode({
      'start': date,
      'end': date,
    });
    Object resObj = await Api.post(url: '/match/bodies', json: json);
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Ballone> body = lisy.map((e) => Ballone.fromJson(e)).toList();
      _setBody(body);
    }
    if (resObj is Failure) {
      _setBodyError(true, resObj.response.toString());
    }
    notifyListeners();
  }

  getMoung({
    required String token,
  }) async {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var json = jsonEncode({
      'start': date,
      'end': date,
    });
    Object resObj = await Api.post(url: '/match/moungs', json: json);
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Ballone> moung = lisy.map((e) => Ballone.fromJson(e)).toList();
      _setMoung(moung);
    }
    if (resObj is Failure) {
      _setMoungError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
