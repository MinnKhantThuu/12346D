import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

import '../model/rule.dart';

class RuleProvider with ChangeNotifier {
  List<Rule> _rules = [];
  bool _isError = false;
  String _errMsg = '';

  List<Rule> get rules => _rules;
  bool get isError => _isError;
  String get errMsg => _errMsg;

  _setRule(List<Rule> rules) {
    _rules = rules;
    notifyListeners();
  }

  _setError(bool err, String msg) {
    _isError = err;
    _errMsg = msg;
    notifyListeners();
  }

  getRules() async {
    Object resObj = await Api.get(url: '/api/rules/KO2');
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Rule> rules = lisy.map((e) => Rule.fromJson(e)).toList();
      // rules.forEach((element) => print(element.desc));
      _setRule(rules);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
