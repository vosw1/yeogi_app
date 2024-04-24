import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:yogi_project/pages/_main_holder.dart';
import 'package:yogi_project/pages/login_page.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';



void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  //  카카오 로그인
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
  nativeAppKey: 'd457203018311325f80b3393e7aace85',
  javaScriptAppKey: '112855c087ffd800e617b3443c45bb57',
  );

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
      routes: {
        '/login': (context) => LoginPage(),
        '/home' : (context) => MainHolder(),
      },
    );
  }
}

