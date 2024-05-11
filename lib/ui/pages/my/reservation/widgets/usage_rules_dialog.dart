import 'package:flutter/material.dart';

class UsageRulesDialog extends StatelessWidget {
  const UsageRulesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('이용규칙 및 취소/환불 규정 동의'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('19세 미만 청소년의 혼숙은 법적으로 불가하며, 이에 대한 숙소의 입실 거부 시 취소/환불이 불가합니다.'),
            Text('업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.'),
            Text('취소/환불 가능 여부는 숙소의 정책을 따릅니다.'),
            Text('취소/환불 규정에 따라 취소 수수료가 발생하는 경우, 취소 수수료는 판매가(상품가격) 기준으로 계산됩니다.')
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