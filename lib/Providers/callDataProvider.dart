import 'package:flutter/material.dart';
import 'package:platform_converter_app/Modal/modal.dart';

class CallDataProvider extends ChangeNotifier {
  List<Contact> _callHistory = [];

  List<Contact> get callHistory => _callHistory;

  void addCall(Contact call) {
    _callHistory.add(call);
    notifyListeners();
  }
}
