import 'package:app/model/lagers.dart';
import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

class LagerProvider with ChangeNotifier {
  List<Lagers> _twoDLagers = [];
  List<Lagers> _threeDLagers = [];
  List<Lagers> _fourDLagers = [];
  List<Lagers> _sixDLagers = [];
  bool _isError = false;
  String _errMsg = '';

  List<Lagers> get twoDLager => _twoDLagers;
  List<Lagers> get threeDLager => _threeDLagers;
  List<Lagers> get fourDLager => _fourDLagers;
  List<Lagers> get sixDLager => _sixDLagers;
  bool get isError => _isError;
  String get errMsg => _errMsg;

  _setLagers(List<Lagers> lagers) {
    List<Lagers> two = [];
    List<Lagers> three = [];
    List<Lagers> four = [];
    List<Lagers> six = [];
    lagers.forEach((lager) {
      if (lager.type == '2D') {
        two.add(lager);
        _twoDLagers = two;
      } else if (lager.type == '3D') {
        three.add(lager);
        _threeDLagers = three;
      } else if (lager.type == '4D') {
        four.add(lager);
        _fourDLagers = four;
      } else {
        six.add(lager);
        _sixDLagers = six;
      }
    });
  }

  _setError(bool isError, String errMsg) {
    _isError = isError;
    _errMsg = errMsg;
  }

  getAllLagers({
    required dynamic token,
  }) async {
    Object resObj = await Api.get(url: '/api/lagers', token: token);
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Lagers> lagers = lisy.map((e) => Lagers.fromJson(e)).toList();
      _setLagers(lagers);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
