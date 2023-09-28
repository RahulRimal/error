import 'package:flutter/material.dart';

abstract class FirstProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  List<String> _data = [];

  List<String> get data => _data;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getAlphabets() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    _data = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
    ];

    loading = false;
  }
}
