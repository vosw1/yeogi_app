import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class EventDetailPage extends StatelessWidget {
  final String BannerImagePath; // 이미지 경로 추가

  const EventDetailPage({Key? key, required this.BannerImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이벤트 상세")),
      body: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // 이미지에 둥근 모서리를 추가할 수 있습니다.
                  boxShadow: [ // 그림자 효과를 줄 수 있습니다.
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    BannerImagePath,
                    fit: BoxFit.fitWidth, // 이미지를 화면에 맞게 확대하여 표시
                  ),
                ),
              ),
            ),
            // 추가적인 위젯들이 여기에 올 수 있습니다.
          ],
        ),
      ),
    );
  }
}
