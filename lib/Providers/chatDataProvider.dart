import 'package:flutter/material.dart';

class ChatDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> chatData = [
    {'message': 'Hello!', 'isSentByMe': true},
    {'message': 'Hi there!', 'isSentByMe': false},
  ];

  void sendMessage(String message) {
    chatData.add({'message': message, 'isSentByMe': true});
    notifyListeners();
  }
}
