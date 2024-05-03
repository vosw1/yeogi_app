import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class HomeHeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(gap_m),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Text(
              "여어떻노.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
                fontFamily: 'Jalnan2TTF',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog( // showDialog로 팝업 창 열기
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("new"), // 팝업 제목
                  content:Text('예약이 완료되었습니다'),
                  actions: <Widget>[
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 팝업 닫기
                        },
                        child: Text("확인"), // 확인 버튼
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: gap_m),
      ],
    );
  }
}