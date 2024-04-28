import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자주 묻는 질문'),
      ),
      body: FAQList(), // FAQList 위젯을 body로 사용합니다.
    );
  }
}

// 자주 묻는 질문 리스트를 표시하는 위젯입니다.
class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 자주 묻는 질문의 개수를 10개로 지정합니다.
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('질문 ${index + 1}'), // 질문을 리스트 타일에 표시합니다.
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FAQAnswerPage(index + 1), // 탭한 아이템에 대한 답변 페이지로 이동
              ),
            );
          },
        );
      },
    );
  }
}

// 자주 묻는 질문 답변 페이지를 표시하는 위젯입니다.
class FAQAnswerPage extends StatelessWidget {
  final int questionNumber;

  FAQAnswerPage(this.questionNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('질문 $questionNumber의 답변'), // 질문 번호를 포함한 페이지의 제목
      ),
      body: Center(
        child: Text('질문 $questionNumber의 답변'), // 답변을 페이지에 표시합니다.
      ),
    );
  }
}
