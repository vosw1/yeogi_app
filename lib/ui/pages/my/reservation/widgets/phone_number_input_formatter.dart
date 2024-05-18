import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Limit input to 13 characters
    if (newValue.text.length > 13) {
      return oldValue;
    }
    return newValue;
  }
}
