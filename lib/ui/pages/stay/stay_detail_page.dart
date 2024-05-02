import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import 'package:yogi_project/ui/pages/stay/widgets/room_info_widget.dart';

import '../../../_core/constants/move.dart';
import '../../../_core/constants/move.dart';
import '../../../_core/constants/scroll_fab.dart';
import '../../../data/models/room.dart';

class StayDetailPage extends StatefulWidget {
  final Stay stayData;
  final Room roomData;

  StayDetailPage({required this.stayData, required this.roomData});

  @override
  _StayDetailPageState createState() => _StayDetailPageState();
}

class _StayDetailPageState extends State<StayDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.stayData.stayName}',
          style: h5(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: isFavorite ? Colors.redAccent : null,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
          SizedBox(width: gap_s),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap_s),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(gap_s),
                  child: Image.asset(
                    'assets/images/${widget.stayData.stayImgTitle}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: gap_m),
              // 리뷰 섹션
              ReviewSection(
                reviews: widget.stayData.reviews ?? [], // reviews가 nullable일 수 있으므로 null일 경우 빈 리스트로 처리
              ),
              SizedBox(height: gap_xx),
              // 편의 시설 섹션
              AmenitySection(),
              SizedBox(height: gap_xx),
              // 객실 선택 섹션
              Text(
                '객실 선택',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              RoomInfoWidget(roomData: widget.roomData), // Stay 클래스에 roomData 필드가 정의되어 있는지 확인해야 함
              SizedBox(height: gap_xx),
              Divider(),
              SizedBox(height: gap_s),
              // 숙소 소개 섹션
              Text(
                '숙소 소개',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              Text(
                widget.stayData.stayInfo,
              ),
              SizedBox(height: gap_xx),
              Divider(),
              SizedBox(height: gap_s),
              Text(
                '이용 정보',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              Text(
                widget.stayData.notice,
              ),
              Divider(),
              SizedBox(height: gap_s),
              // 취소 및 환불 규정 섹션
              Text(
                '취소 및 환불 규정',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              Text(
                '객실별 취소 정책이 상이하니 객싱 상세정보에서 확인해주세요',
              ),
              SizedBox(height: gap_m),
            ],
          ),
        ),
      ),
      floatingActionButton: ScrollFAB(controller: _scrollController),
    );
  }
}
