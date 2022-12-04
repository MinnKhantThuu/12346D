// ignore_for_file: unused_element

import 'package:app/model/user.dart';
import 'package:app/utils/api_status.dart';
import 'package:flutter/material.dart';

import '../utils/api.dart';

class AuthProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  bool _isError = false;
  bool _success = false;
  String _errMsg = "";

  User get user => _users[0];
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errMsg => _errMsg;
  bool get success => _success;

  _setLoading(bool loading) => _isLoading = loading;
  _setError(bool err, String errMsg) {
    _isError = err;
    _errMsg = errMsg;
    // print(_errMsg);
  }

  setSuccess(bool success) {
    _success = success;
  }

  _setUser(User user) async {
    // _users.add(user);
    _users.add(user);
    // print("User name is " + user.name);
    notifyListeners();
  }

  login({required dynamic json}) async {
    Object res = await Api.post(url: '/api/login', json: json);
    if (res is Success) {
      User user = User.fromJson(res.response);
      setSuccess(true);
      _setUser(user);
    }
    if (res is Failure) {
      _setError(true, res.response.toString());
      // print(res.response.toString());
    }
    notifyListeners();
  }
}
