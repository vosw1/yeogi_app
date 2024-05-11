import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('개인정보 수집 및 이용 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('구분\t수집 목적\t수집 항목\t보유 및 이용기간'),
            Text('필수\t예약/구매 서비스 제공 상담 및 부정거래 기록 확인\t'),
            Text(
                '[예약·구매]\n예약자 정보(이름, 휴대전화번호)\n[결제]\n거래내역\n*결제 시 개인정보는 PG사(결제대행업체)에서 수집 및 저장하고 있으며, 회사는 PG사에서 제공하는 거래 내역만 제공받음\n[거래명세서 발급]\n이메일주소\n[현금영수증 발급]\n휴대전화번호, 이메일주소\n[취소·환불]\n은행명, 계좌번호, 예금주명\n- 회원 탈퇴 시 까지\n* 관계 법령에 따라 보존할 필요가 있는 경우 해당 법령에서 요구하는 기한까지 보유'),
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