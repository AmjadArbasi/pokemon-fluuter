import 'package:flutter/material.dart';

class SelectPageProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void updatePage(int newNumberPage) {
    _currentPage = newNumberPage;
    notifyListeners();
  }
}
