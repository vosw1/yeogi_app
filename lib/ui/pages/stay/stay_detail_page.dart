import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/stay/widgets/room_info_widget.dart';

class StayDetailPage extends StatefulWidget {
  final Stay stays;
  final Room rooms;

  StayDetailPage({required this.stays, required this.rooms});

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
          '${widget.stays.stayName}',
          style: TextStyle(fontSize: 20),
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
                    'assets/images/${widget.stays.stayImgTitle}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: gap_m),
              // Review section
              ReviewSection(reviews: widget.stays.reviews ?? []),
              SizedBox(height: gap_xx),
              // 편의 시설 섹션
              AmenitySection(),
              SizedBox(height: gap_xx),
              // 객실 선택 섹션
              Text(
                '객실 선택',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: gap_m),
              RoomInfoWidget(roomData: widget.rooms),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.rooms),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.rooms),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.rooms),
              SizedBox(height: gap_s),
              Divider(),
              SizedBox(height: gap_s),
              // 숙소 소개 섹션
              Text(
                '숙소 소개',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: gap_m),
              Text(
                widget.stays.stayInfo,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: gap_xx),
              Divider(),
              SizedBox(height: gap_s),
              Text(
                '이용 정보',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: gap_m),
              Text(
                widget.stays.notice,
                style: TextStyle(fontSize: 16),
              ),
              Divider(),
              SizedBox(height: gap_s),
              // 취소 및 환불 규정 섹션
              Text(
                '취소 및 환불 정책',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: gap_m),
              Text(
                '객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요',
                style: TextStyle(fontSize: 16),
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
