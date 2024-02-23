import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    _isLoaded = true;
    notifyListeners();
  }
}
