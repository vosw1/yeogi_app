import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

// 자주 묻는 질문 아이템 모델
class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({required this.question, required this.answer, this.isExpanded = false});

  void toggle() {
    isExpanded = !isExpanded;
  }
}

// 자주 묻는 질문 리스트를 표시하는 위젯입니다.
class FAQList extends StatelessWidget {
  final List<FAQItem> faqItems;

  FAQList({required this.faqItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQ")),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  faqItems[index].toggle(); // 아이템의 확장 상태를 토글합니다.
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        faqItems[index].question,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(faqItems[index].isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down), // 확장 상태에 따라 아이콘 변경
                  ],
                ),
              ),
              if (faqItems[index].isExpanded)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: gap_m),
                  child: Text(faqItems[index].answer),
                ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

// 자주 묻는 질문 답변 페이지
class FAQAnswerPage extends StatelessWidget {
  final FAQItem faqItem;

  FAQAnswerPage({required this.faqItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("자주 묻는 질문")),
      body: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              faqItem.question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: gap_m),
            Text(
              faqItem.answer,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
