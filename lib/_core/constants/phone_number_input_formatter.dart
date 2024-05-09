// 전화번호 형식을 자동으로 조정하는 Formatter
import 'dart:math';

import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (newText.length >= 11) {
      return TextEditingValue(
        text: newText.replaceFirstMapped(RegExp(r'(\d{3})(\d{4})(\d+)'), (Match m) => '${m[1]}-${m[2]}-${m[3]}'),
        selection: newValue.selection.copyWith(
          baseOffset: min(newValue.selection.start, 13),
          extentOffset: min(newValue.selection.end, 13),
        ),
      );
    }
    return newValue;
  }
}
