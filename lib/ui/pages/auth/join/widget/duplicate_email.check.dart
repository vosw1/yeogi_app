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

    // 이메일이 공백인지 확인
    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일을 입력해주세요.')),
      );
      return; // 이메일이 비어 있으면 함수를 종료합니다.
    }

    // 서버 또는 데이터베이스와 통신하여 이메일 중복 확인
    bool isEmailDuplicate = _isEmailDuplicate(email);

    if (isEmailDuplicate) {
      // 이메일이 중복되었을 경우 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('중복된 이메일입니다.')),
      );
    } else {
      // 이메일이 중복되지 않았을 경우 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('사용 가능한 이메일입니다.')),
      );
    }
  }

  // 이메일 중복 확인 함수 (가짜 함수)
  bool _isEmailDuplicate(String? email) {
    // 여기서는 가짜 함수로 구현하였으며, 실제로는 서버 또는 데이터베이스와 통신하여 확인해야 합니다.
    // 이 예시에서는 임의로 'test@email.com'이 중복되었다고 가정합니다.
    return email == 'test@email.com';
  }
}
