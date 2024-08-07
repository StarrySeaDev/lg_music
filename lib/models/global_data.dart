import 'package:flutter/material.dart';

class GlobalData with ChangeNotifier {
  final List<String> _history = [];

  List<String> get history => _history;

  void addHistory(String value) {
    _history.add(value);
    notifyListeners();
  }
}