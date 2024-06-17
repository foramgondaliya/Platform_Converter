import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomProvider extends ChangeNotifier {
  int bottomNavIndex = 0;

  void bottomNavigation(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }
}
