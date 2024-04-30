import 'package:flutter/material.dart';

class DuplimentEmailCheck extends StatelessWidget {
  final TextEditingController emailController;

  const DuplimentEmailCheck({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _checkDuplicateEmail(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent, // 버튼 색상을 빨간색으로 설정
      ),
      child: Text(
        '중복 확인',
        style: TextStyle(color: Colors.white), // 텍스트 색상을 흰색으로 설정
      ),
    );
  }

  void _checkDuplicateEmail(BuildContext context) {
    String? email = emailController.text;

    // 이메일 유효성 검사
    String? validationResult = validateEmail(email);
    if (validationResult != null) {
      _showErrorDialog(context, validationResult);
      return;
    }

    // 서버 또는 데이터베이스와 통신하여 이메일 중복 확인
    bool isEmailDuplicate = _isEmailDuplicate(email);

    if (isEmailDuplicate) {
      // 이메일이 중복되었을 경우 처리
      _showErrorDialog(context, '중복된 이메일입니다.');
    } else {
      // 이메일이 중복되지 않았을 경우 처리
      _showSuccessDialog(context, '사용 가능한 이메일입니다.');
    }
  }

  // 이메일 중복 확인 함수 (가짜 함수)
  bool _isEmailDuplicate(String? email) {
    // 여기서는 가짜 함수로 구현하였으며, 실제로는 서버 또는 데이터베이스와 통신하여 확인해야 합니다.
    // 이 예시에서는 임의로 'test@email.com'이 중복되었다고 가정합니다.
    return email == 'test@email.com';
  }

  // 이메일 유효성 검사 함수
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "올바른 이메일 형식이 아닙니다.";
    } else {
      return null;
    }
  }

  // 이메일 형식 검사 함수
  bool isEmail(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(value ?? '');
  }

  // 에러 다이얼로그 표시
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('오류'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 성공 다이얼로그 표시
  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('성공'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
