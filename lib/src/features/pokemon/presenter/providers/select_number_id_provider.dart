import 'package:flutter/material.dart';

class SelectNumberIdProvider extends ChangeNotifier {
  int _numberID = 0;
  int get numberID => _numberID;

  SelectNumberIdProvider();

  changeID(int newID) {
    _numberID = newID;
    notifyListeners();
  }
}
