import 'package:flutter/material.dart';
import 'package:yogi_project/components/data/tab.dart';
import 'package:yogi_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Key 타입의 key 파라미터 추가

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jua-Regular.ttf'),
      home: HomePage(),
    );
  }
}

