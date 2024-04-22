import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:yogi_project/pages/_main_holder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: '8fqjbfi1qb',
    onAuthFailed: (e) => print("오류 내용 : ${e.message}"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Key 타입의 key 파라미터 추가

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jua-Regular.ttf'),
      home: MainHolder(),
    );
  }
}

