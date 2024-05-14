import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class UsageRulesDialog extends AlertDialog {
  const UsageRulesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('이용규칙 및 취소/환불 규정 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('이용규칙'),
            SizedBox(height: gap_s),
            Text('최대 인원 초과 시 입실 불가합니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('정원 기준 요금 외 인원 추가 요금은 현장결제입니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('제공 이미지는 배정된 객실과 다를 수 있습니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('제공 정보는 숙소의 사정에 따라 변경될 수 있습니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('조식, 인원, 침구, 침대 등 추가는 예약하신 숙소로 요청 및 결제 가능합니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            SizedBox(height: gap_s),
            Text('취소/환불규정'),
            SizedBox(height: gap_s),
            Text('여어떻노에서 판매되는 국내 호텔/리조트/펜션/게스트하우스/캠핑/홈앤빌라 상품은 예약/결제 후 10분 이내에는 무료취소 가능합니다. (단, 체크인 시간 경과 시 취소불가)', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('예약 상품 별 숙소 정보에 기재된 취소, 환불 규정을 반드시 확인 후 이용해주시기 바랍니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('취소, 변경 불가 상품은 규정과 상관없이 취소, 변경이 불가합니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
            Text('단! 숙소의 객실 정보가 수시로 변경될 수 있으며 이로 인한 불이익은 여기어때가 책임지지 않습니다.', style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center, // 버튼들을 중앙에 배치
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
