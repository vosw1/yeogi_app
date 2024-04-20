import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

class MyPageLoginButton extends StatelessWidget {
  const MyPageLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded( // Expanded 위젯 사용
            child: Padding( // Padding 위젯 추가
              padding: const EdgeInsets.only(top: gap_s, left: gap_s, right: gap_s), // 양옆 패딩 설정
              child: InkWell(
                onTap: () {
                  // 로그인/회원가입 로직 추가
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 15,
                  alignment: Alignment.center, // 컨테이너 내부의 텍스트를 중앙에 정렬
                  child: Text(
                    "회원가입 / 로그인",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
