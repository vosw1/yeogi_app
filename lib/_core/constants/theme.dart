import 'package:flutter/material.dart';

// 테마 통일시켜서 사용하기

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    centerTitle: true,
    backgroundColor: Colors.black12,
    elevation: 0,
  );
}
