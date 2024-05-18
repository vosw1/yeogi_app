import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_result_list.dart';

class ScrapListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '찜한 숙소',
          style: h4(),
        ),
      ),
      body: ScrapResultList(), // ScrapResultList 위젯을 불러와서 사용
    );
  }
}
