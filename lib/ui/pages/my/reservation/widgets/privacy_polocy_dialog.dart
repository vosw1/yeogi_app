import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class PrivacyPolicyDialog extends AlertDialog {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('개인정보 수집 및 이용 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              '구분 : 필수',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '수집 목적 : 예약/구매 서비스 제공 상담 및 부정거래 기록 확인',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '수집항목',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '[예약·구매] 예약자 정보(이름, 휴대전화번호)',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '[결제] 거래내역',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_xx),
            Text(
              '*결제 시 개인정보는 PG사(결제대행업체)에서 수집 및 저장하고 있으며, 회사는 PG사에서 제공하는 거래 내역만 제공받음',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '[거래명세서 발급] 이메일주소',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '[현금영수증 발급] 휴대전화번호, 이메일주소',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '[취소·환불] 은행명, 계좌번호, 예금주명',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_s),
            Text(
              '회원 탈퇴 시 까지\n* 관계 법령에 따라 보존할 필요가 있는 경우 해당 법령에서 요구하는 기한까지 보유',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: gap_m),
            Text(
              '※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: gap_xx),
            Text(
              '※ 개인정보 처리와 관련된 상세 내용은 \'개인정보처리방침\'을 참고',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
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
