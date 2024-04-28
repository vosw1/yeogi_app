import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Google 지도 위젯을 사용하기 위한 import 문 추가
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:yogi_project/pages/_main_holder.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 카카오 로그인
  KakaoSdk.init(
    nativeAppKey: 'd457203018311325f80b3393e7aace85',
    javaScriptAppKey: '112855c087ffd800e617b3443c45bb57',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jalnan2TTF'),
      home: MainHolder(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home' : (context) => MainHolder(),
      },
    );
  }
}


