// 사이즈 통일시켜서 사용하기
import 'package:flutter/cupertino.dart';

// 간격
const double gap_xxl = 100;
const double gap_xl = 80;
const double gap_l = 50;
const double gap_xm = 40;
const double gap_m = 20;
const double gap_s = 10;
const double gap_xs = 5;
const double gap_xx = 1;
const double gap_xxx = 0.1;

// 헤더 높이
const double header_height = 620;

// MediaQuery 클래스로 화면 사이즈를 받을 수 있다.
double getBodyWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.7;
}