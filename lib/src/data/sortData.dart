import 'package:flutter/material.dart';

class SortData with ChangeNotifier {
  int _level1;
  int _level1_1;
  int _level1_2;

  int get level1 => _level1;

  int get level1_1 => _level1_1;

  int get level1_2 => _level1_2;

  SortData() {
    this._level1 = 0;
    this._level1_1 = 1;
    this._level1_2 = 0;
  }

  void setLevel1(int newValue) {
    if (newValue == _level1) {
      _level1 = 0;
    } else {
      _level1 = newValue;
    }
    notifyListeners();
  }

  void setLevel1_1(int newValue) {
    if (newValue != _level1_1) {
      _level1_1 = newValue;
      notifyListeners();
    }
  }

  void setLevel1_2(int newValue) {
    if (newValue != _level1_2) {
      _level1_2 = newValue;
      _level1 = 0;
      notifyListeners();
    }
  }
}