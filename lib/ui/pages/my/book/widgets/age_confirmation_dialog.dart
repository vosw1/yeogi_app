import 'package:flutter/material.dart';

class AgeConfirmationDialog extends StatelessWidget {
  const AgeConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('만 14세 이상 확인'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('여어떻노는 만 14세 미만 아동의 서비스 이용을 제한하고 있습니다.'),
            Text('개인정보 보호법에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를 받도록 규정하고 있으며,'),
            Text(
                '만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스 이용이 제한될 수 있음을 알려드립니다.')
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
