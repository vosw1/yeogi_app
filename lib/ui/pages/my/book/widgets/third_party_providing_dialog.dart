import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/room.dart';

class ThirdPartyProvidingDialog extends StatelessWidget {
  const ThirdPartyProvidingDialog(Room rooms, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('개인정보 제3자 제공 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('제공받는 자\t${rooms.roomName}'),
            Text('제공 목적\t숙박예약서비스 이용계약 이행\n(서비스 제공, 확인, 이용자 정보 확인)'),
            Text(
                '제공하는 항목\t예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약 업체명, 예약한 객실명, 결제금액)'),
            Text('보유 및 이용기간\t예약서비스 제공 완료 후 6개월'),
            Text('※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.'),
            Text('※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고')
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('확인'),
        ),
      ],
    );
  }
}


