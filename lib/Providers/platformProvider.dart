import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformProvider extends ChangeNotifier {
  bool isIOS = false;

  void changePlatform() {
    isIOS = !isIOS;
    notifyListeners();
  }
}
