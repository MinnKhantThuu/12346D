import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';

import '../model/slide.dart';
import 'package:flutter/material.dart';

class SlideProvider with ChangeNotifier {
  List<Slide> _slide = [];
  bool _isError = false;
  String _errMsg = "";

  List<Slide> get slide => _slide;
  bool get isError => _isError;
  String get errMsg => _errMsg;

  _setError(bool err, String errMsg) {
    _isError = err;
    _errMsg = errMsg;
    notifyListeners();
  }

  _setSlide(List<Slide> slide) {
    _slide = slide;
    notifyListeners();
  }

  getSlide() async {
    Object resObj = await Api.get(url: '/api/slides/KO2');
    if (resObj is Success) {
      List lisy = resObj.response as List;
      List<Slide> slide = lisy.map((e) => Slide.fromJson(e)).toList();
      _setSlide(slide);
    }
    if (resObj is Failure) {
      _setError(true, resObj.response.toString());
    }
    notifyListeners();
  }
}
