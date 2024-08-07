import 'package:flutter/material.dart';

class SearchSuggestProvider with ChangeNotifier {
  bool _showSuggest = false;
  List<String> _searchSuggest = [];
  
  bool get showSuggest => _showSuggest;
  List<String> get searchSuggest => _searchSuggest;

  void addSuggest(List<String> suggest) {
    _searchSuggest = suggest;
    notifyListeners();
  }

  void changeShowStatus(bool show) {
    _showSuggest = show;
    notifyListeners();
  }
}