import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:yogi_project/ui/pages/_main_holder.dart';
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
    return GetMaterialApp(
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


