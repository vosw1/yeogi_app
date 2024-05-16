import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/auth/join/join_page.dart';
import 'package:yogi_project/ui/pages/auth/login/widgets/social_login.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap_s, vertical: gap_s),
      child: Column(
        children: [
          // ElevatedButton(
          //   onPressed: signInWithKakao,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       FaIcon(FontAwesomeIcons.comment, color: Colors.black),
          //       SizedBox(width: 10),
          //       Text(
          //         '카카오로 로그인',
          //         style: TextStyle(
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.symmetric(vertical: gap_m),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(14),
          //     ),
          //     backgroundColor: Colors.yellow,
          //   ),
          // ),
          SizedBox(height: gap_xxx),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()),
              );
            },
            child: Text(
              '아직 회원이 아니시면 회원가입',
              style: TextStyle(
                color: Colors.redAccent,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
