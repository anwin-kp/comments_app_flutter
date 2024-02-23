import 'package:flutter/material.dart';

// This class provides the view model for the Custom Text Field Widget.
class TextFieldProvider with ChangeNotifier {
  bool _obscureText = true;
  bool _isValid = false;

  bool get obscureText => _obscureText;
  bool get isValid => _isValid;

  // This method updates the Password visibility and notifies listeners.
  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  // This method validates a value and notifies listeners.
  void validateField(FormFieldValidator<String?>? validator, String? value) {
    _isValid = validator == null ? true : validator(value) == null;
    notifyListeners();
  }
}
