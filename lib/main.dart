import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:yogi_project/ui/pages/_main_holder.dart';
import 'package:yogi_project/ui/pages/auth/login/login_page.dart';
import 'package:yogi_project/ui/pages/home/home_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 카카오 로그인
  KakaoSdk.init(
    nativeAppKey: 'd457203018311325f80b3393e7aace85',
    javaScriptAppKey: '112855c087ffd800e617b3443c45bb57',
  );

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // context가 없는 곳에서 context를 사용할 수 있는 방법 (몰라도 됨)
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Jalnan2TTF'),
      home: MainHolder(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}


