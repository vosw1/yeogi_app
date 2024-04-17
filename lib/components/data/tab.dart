import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tab {
  final IconData icon;
  final String text;

  Tab({
    required this.icon,
    required this.text,
  });
}

List<Tab> tabs = [
  Tab(icon: FontAwesomeIcons.clock, text: "최근 본 상품"),
  Tab(icon: FontAwesomeIcons.percent, text: "할인 * 혜택"),
  Tab(icon: FontAwesomeIcons.reply, text: "내 리뷰"),
  Tab(icon: FontAwesomeIcons.bell, text: "알림함"),
];