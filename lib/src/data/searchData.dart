import 'package:flutter/material.dart';

class SearchData with ChangeNotifier {
  int _level1;
  int _level1_1;
  int _level1_2;
  int _distance;
  String _menuTag;
  String _district;
  Set<String> _tag;

  int get level1 => _level1;

  String get menuTag => _menuTag;

  int get level1_1 => _level1_1;

  int get level1_2 => _level1_2;

  int get distance => _distance;

  String get district => _district;

  Set<String> get tag => _tag;

  SearchData() {
    this._level1_1 = 1;
    this._level1_2 = 0;
    this._menuTag = "";
    this._tag = Set<String>();
  }

  void changeTag(String tag) {
    if (_tag.contains(tag)) {
      _tag.remove(tag);
    } else {
      _tag.add(tag);
    }
    notifyListeners();
  }

  void setMenuTag(String tag) {
    if (_menuTag == tag) {
      _menuTag = "";
    } else {
      _menuTag = tag;
    }
    notifyListeners();
  }

  void setDistance(int newValue) {
    if (_distance != newValue) {
      _distance = newValue;
    }
  }

  void setDistrict(String newValue) {
    if (_district != newValue) {
      _district = newValue;
      _level1 = 0;
      notifyListeners();
    }
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