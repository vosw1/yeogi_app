import 'package:flutter/services.dart';

void copyToClipboard(String url) {
  Clipboard.setData(ClipboardData(text: url));
  print('URL이 클립보드에 복사되었습니다.');
}
