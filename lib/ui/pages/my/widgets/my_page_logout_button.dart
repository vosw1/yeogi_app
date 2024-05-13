import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

// 마이페이지 로그아웃 버튼
class MyPageLogoutButton extends StatelessWidget {
  const MyPageLogoutButton({super.key, required Null Function() onTap});

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
                  // todo: 로그아웃 기능 구현
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 15,
                  alignment: Alignment.center,
                  child: Text(
                    "로그아웃",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
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
