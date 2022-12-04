import 'package:app/model/bank.dart';
import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

class BankProvider with ChangeNotifier {
  List<Bank> _banks = [];
  bool _isError = false;
  String _errMsg = '';

  List<Bank> get banks => _banks;
  bool get isError => _isError;
  String get errMsg => _errMsg;

  _setBanks(List<Bank> banks) {
    _banks = banks;
    notifyListeners();
  }

  _setError(bool err, String msg) {
    _isError = err;
    _errMsg = msg;
    notifyListeners();
  }

  getBanks() async {
    Object resObj = await Api.get(url: '/api/banks/KO2');
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Bank> banks = lisy.map((e) => Bank.fromJson(e)).toList();
      // banks.forEach((element) => print(element.name));
      _setBanks(banks);
    }
    if (resObj is Success) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
