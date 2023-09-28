import 'package:flutter/material.dart';

abstract class SecondProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  List<String> _data = [];

  List<String> get data => _data;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getWords() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    _data = [
      "Apple",
      "Banana",
      "Cat",
      "Dog",
      "Elephant",
      "Fox",
      "Giraffe",
      "Horse",
      "Igloo",
      "Jellyfish",
      "Kangaroo",
      "Lion",
      "Monkey",
      "Newt",
      "Octopus",
      "Penguin",
      "Quokka",
      "Rabbit",
      "Snake",
      "Tiger",
      "Umbrella",
      "Violin",
      "Whale",
      "Xylophone",
      "Yak",
      "Zebra"
    ];

    loading = false;
  }
}
