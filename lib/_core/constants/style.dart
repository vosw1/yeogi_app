// 글자 스타일 통일시켜서 사용하기
import 'package:flutter/material.dart';

TextStyle h4({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 25, color: mColor);
}

TextStyle h5({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 20, color: mColor);
}

TextStyle h6({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 16, color: mColor);
}

TextStyle subtitle1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 14, color: mColor);
}

TextStyle subtitle2({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 12, color: mColor);
}

TextStyle overLine({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 10,color: mColor);
}

TextStyle body1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 16, color: mColor);
}