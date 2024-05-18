import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String newText = _applyMask(newValue.text);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _applyMask(String input) {
    // Remove non-digit characters
    String cleaned = input.replaceAll(RegExp(r'\D'), '');

    // Limit to 11 digits
    if (cleaned.length > 11) {
      cleaned = cleaned.substring(0, 11);
    }

    final buffer = StringBuffer();

    for (int i = 0; i < cleaned.length; i++) {
      if (i == 3 || i == 7) {
        buffer.write('-');
      }
      buffer.write(cleaned[i]);
    }

    return buffer.toString();
  }
}
