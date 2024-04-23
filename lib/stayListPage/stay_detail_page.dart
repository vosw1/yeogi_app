import 'package:flutter/material.dart';
import 'package:yogi_project/components/data/home_item_data.dart';

class StayDetailPage extends StatelessWidget {
  final ItemData itemData;

  const StayDetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('상세 정보'),
            Text('숙소 이미지: ${itemData.stayImgTitle}'),
            Text('별점: ${itemData.starCount}'),
            Text('코멘트: ${itemData.comment}'),
            Text('사용자 이미지: ${itemData.userImgTitle}'),
            Text('사용자 이름: ${itemData.userName}'),
            Text('위치: ${itemData.location}'),
          ],
        ),
      ),
    );
  }
}
