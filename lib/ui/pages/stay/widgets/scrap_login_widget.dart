import 'package:flutter/material.dart';

void showLoginAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("로그인 필요"),
        content: Text("로그인을 먼저 해주세요."),
        actions: [
          TextButton(
            child: Center(child: Text("로그인 페이지로 이동", style: TextStyle(color: Colors.redAccent),)),
            onPressed: () {
              // 현재 AlertDialog를 닫음
              Navigator.of(context).pop();

              // 이동을 다음 이벤트 루프에서 수행하여 이미 닫힌 후에 이동하도록 함
              Future.delayed(Duration.zero, () {
                Navigator.pushNamed(context, '/login');
              });
            },
          ),
        ],
      );
    },
  );
}