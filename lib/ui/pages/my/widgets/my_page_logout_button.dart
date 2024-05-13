import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';

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
                onTap: () async {
                  // 로그아웃 로직 수행, 예를 들어 SessionStore의 logout을 호출
                  await SessionStore().logout();
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
                    style: TextStyle(fontSize: 17, color: Colors.white),
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
