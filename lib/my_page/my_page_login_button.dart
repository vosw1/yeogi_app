import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

// 마이페이지 회원가입/로그인 버튼
class MyPageLoginButton extends StatelessWidget {
  const MyPageLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: gap_s, left: gap_s, right: gap_s),
              child: InkWell(
                onTap: () {
                  print("버튼 클릭됨");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 15,
                  alignment: Alignment.center,
                  child: Text(
                    "회원가입 / 로그인",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center,
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
