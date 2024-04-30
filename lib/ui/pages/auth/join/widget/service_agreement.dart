import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/style.dart';

class ServiceAgreement extends StatefulWidget {
  @override
  _ServiceAgreementState createState() => _ServiceAgreementState();
}

class _ServiceAgreementState extends State<ServiceAgreement> {
  List<bool> _subCheckboxValues = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('서비스 약관 내용'), // 페이지 타이틀 제목
        ),
        body: Column(
          children: [
            for (int index = 0; index < _subCheckboxValues.length; index++)
              _buildSubCheckbox(index),
            // 이후에 필요한 위젯 추가 가능
          ],
        ),
      ),
    );
  }

  Widget _buildSubCheckbox(int index) {
    return Column(
      children: [
        Text(
          '서비스 약관 내용 ${index + 1}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: _subCheckboxValues[index],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _subCheckboxValues[index] = value;
                  });
                }
              },
            ),
            GestureDetector(
              onTap: () {
                _showPopup(context, index);
              },
              child: Text(
                '약관 보기',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showPopup(BuildContext context, int index) {
    AlertDialog alertDialog;

    switch (index) {
      case 0:
        alertDialog = _buildDialog(
          title: '이용규칙 및 취소/환불 동의',
          content: [
            _buildDialogContent('이용규칙', '내용'),
            _buildDialogContent('취소/환불 규정', '내용'),
          ],
        );
        break;
      case 1:
        alertDialog = _buildDialog(
          title: '개인정보 수집 및 이용 동의',
          content: [
            _buildDialogContent('구분', '내용'),
          ],
        );
        break;
      case 2:
        alertDialog = _buildDialog(
          title: '만 14세 이상 확인',
          content: [
            _buildDialogContent('', '내용'),
          ],
        );
        break;
      default:
        alertDialog = _buildDefaultDialog(context);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  Widget _buildDialogContent(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(content),
        SizedBox(height: 10),
      ],
    );
  }

  AlertDialog _buildDialog({required String title, required List<Widget> content}) {
    return AlertDialog(
      title: Text(title, style: h6()),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ),
      backgroundColor: Colors.white,
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

  AlertDialog _buildDefaultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Notice'),
      content: Text('일치하는 팝업이 없습니다.'),
      backgroundColor: Colors.white,
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('확인'),
          ),
        ),
      ],
    );
  }

  void _showPopups(BuildContext context) {
    List<String> uncheckedAgreements = [];

    // 각 약관에 대해 동의하지 않은 경우를 확인하여 리스트에 추가합니다.
    for (int index = 0; index < _subCheckboxValues.length; index++) {
      if (!_subCheckboxValues[index]) {
        uncheckedAgreements.add('서비스 약관 내용 ${index + 1}');
      }
    }

    // 모든 약관에 동의하지 않은 경우 알림 다이얼로그를 표시합니다.
    if (uncheckedAgreements.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: uncheckedAgreements
                  .map((agreement) => Text(agreement))
                  .toList(),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
