import 'package:dio/dio.dart';

// DIO 라이브러리 설정 -> 통신을 편하게 하기 위함

// window ip 확인 : ipconfig
final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.219.110:8080", // 내 IP 입력
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 200 이 아니어도 예외 발생안하게 설정
  ),
);

const secureStorage = FlutterSecureStorage();
