import 'package:flutter/material.dart';
import 'package:yogi_project/components/data/home_item_data.dart';
import 'package:yogi_project/room_detail_page/room_detail.page.dart';
import 'package:yogi_project/size.dart';
import 'package:yogi_project/style.dart';


class StayDetailPage extends StatelessWidget {
  final ItemData itemData;

  const StayDetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숙소 상세 페이지'),
      ),
      body: Padding(
        padding: EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${itemData.stayName}', style: h5()), // 숙소명
            SizedBox(
                width:600,
                height:200,
                child: Image.asset('assets/images/${itemData.stayImgTitle}')), // 숙소 이미지
            SizedBox(height: gap_m),

            Text('${itemData.location}', style: subtitle1()), // 위치
            Text('${itemData.roomName}', style: subtitle1()), // 방이름
            Text('${itemData.stayInfo}', style: subtitle1()), // 특이사항
            Text('${itemData.personCount}', style: subtitle1()), // 인원수
            Text('${itemData.price}', style: subtitle1()), // 금액
            Text('${itemData.checkInDate}', style: subtitle1()), // 체크인 시간
            Text('${itemData.checkOutDate}', style: subtitle1()), // 체크아웃 시간
            Text('${itemData.roomInfo}', style: subtitle1()), // 추가정보
            Text('${itemData.amenities}', style: subtitle1()), // 편의시설
            Text('${itemData.cancellationAndRefundPolicy}', style: subtitle1()), // 취소 및 환불 정책
            Text('${itemData.notice}', style: subtitle1()), // 여어떻노 공지
            SizedBox(height: 16),
            // todo : 상세보기 버튼이 아니라 룸 리스트 만들어서 거기서 이동하게 만들기
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomDetailPage(itemData: itemData)),
                );
              },

              child: Text('상세보기'),
            ),
          ],
        ),
      ),
    );
  }
}