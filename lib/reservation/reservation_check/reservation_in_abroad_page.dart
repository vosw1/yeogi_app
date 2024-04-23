import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

class ReservationInAbroadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '해외 숙소 예약내역',
          style: TextStyle(fontSize: gap_m),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: gap_m), // 간격 조정
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: gap_m), // 리스트 아이템 패딩
              itemCount: 10, // 숙소 개수에 맞게 조정
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero, // ListTile 내부 패딩 제거
                  leading: IconButton(
                    icon: Icon(Icons.check), // 예약 버튼 아이콘
                    onPressed: () {
                      // 예약 버튼 클릭 시 동작 추가
                    },
                  ),
                  title: Text('숙소 $index'), // 숙소 이름 또는 정보로 변경
                  subtitle: Text('숙소 설명 $index'), // 숙소 설명으로 변경
                  onTap: () {
                    // 숙소를 선택하여 상세 정보 페이지로 이동하는 동작 추가
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}