import 'dart:convert';

import 'package:app/model/slip.dart';
import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

class SlipProvider with ChangeNotifier {
  List<Slip> _slips = [];
  bool _err = false;
  String _errMsg = '';
  bool _isLoading = false;

  List<Slip> get slips => _slips;
  bool get err => _err;
  String get errMsg => _errMsg;
  bool get isLoading => _isLoading;

  setSlip(List<Slip> slips) {
    _slips = slips;
    print(slips);
  }

  _setError(bool err, String errMsg) {
    _err = err;
    _errMsg = errMsg;
  }

  _setLoading(bool loading) {
    _isLoading = loading;
  }

  getSlips({
    required String token,
    required String startDate,
    required String endDate,
  }) async {
    _setLoading(true);
    // String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var json = jsonEncode({
      'start': startDate,
      'end': endDate,
    });
    Object resObj = await Api.post(url: '/bet/slips', json: json, token: token);
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Slip> slips = lisy.map((data) => Slip.fromJson(data)).toList();
      setSlip(slips);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    _setLoading(false);
    notifyListeners();
  }
}
