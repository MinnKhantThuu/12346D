// ignore_for_file: unused_element

import 'package:app/model/setting.dart';
import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  List<Setting> _setting = [];
  // Setting _setting = jsonDecode(defaultSetting());
  bool _isLoading = false;
  bool _isError = false;
  String _errMsg = '';

  Setting get setting => _setting[0];
  bool get isError => _isError;
  bool get isLoading => _isLoading;
  String get errMsg => _errMsg;

  _setSetting(Setting setting) {
    _setting.add(setting);
    notifyListeners();
  }

  _setError(bool err, String errMsg) {
    _isError = err;
    _errMsg = errMsg;
    notifyListeners();
  }

  _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  getSetting() async {
    Object resObj = await Api.get(url: '/api/settings/KO2');
    print(resObj);
    if (resObj is Success) {
      // Map<String, dynamic> response = resObj.response as Map<String, dynamic>;
      Setting setting = Setting.fromJson(resObj.response);
      _setSetting(setting);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
