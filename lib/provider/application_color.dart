import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true;

  bool get isLightBlue => _isLightBlue;

  set isLightBlue(bool value) {
    _isLightBlue = value;
    notifyListeners(); // To tell "Consumer" Widget if there's a change from ChangeNotifier
  }

  Color get getColor => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
