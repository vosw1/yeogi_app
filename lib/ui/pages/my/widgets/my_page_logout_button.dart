import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/store/session_store.dart';

class MyPageLogoutButton extends ConsumerWidget {
  const MyPageLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: gap_s, left: gap_s, right: gap_s),
              child: InkWell(
                onTap: () {
                  // SessionStore의 logout 메서드 호출
                  SessionStore().logout();
                  // 현재 페이지에 머무르므로 추가적인 네비게이션 코드는 필요 없음
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "로그아웃",
                    style: h5(mColor: Colors.white),
                    textAlign: TextAlign.center,
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
