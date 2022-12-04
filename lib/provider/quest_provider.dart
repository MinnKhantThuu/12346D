import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

import '../model/quest.dart';

class QuestProvider with ChangeNotifier {
  List<Quest> _quests = [];
  bool _isError = false;
  String _errMsg = '';

  List<Quest> get quests => _quests;
  bool get isError => _isError;
  String get errMsg => _errMsg;

  _setQuests(List<Quest> quests) {
    _quests = quests;
    notifyListeners();
  }

  _setError(bool err, String msg) {
    _isError = err;
    _errMsg = msg;
    notifyListeners();
  }

  getQuests() async {
    Object resObj = await Api.get(url: '/api/quests/KO2');
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Quest> quests = lisy.map((e) => Quest.fromJson(e)).toList();
      _setQuests(quests);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
