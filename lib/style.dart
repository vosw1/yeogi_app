// 텍스트 스타일
import 'package:flutter/material.dart';

TextStyle h4({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle h5({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle subtitle1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle subtitle2({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle overLine({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle body1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 16, color: mColor);
}