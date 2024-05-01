import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import '../../../data/models/room.dart';
import '../room/room_data_info.dart';
import 'widgets/ReviewWidget.dart';

// 숙소 상세 페이지
class StayDetailPage extends StatefulWidget {
  final Stay stayData;
  final Room roomData;

  StayDetailPage({required this.stayData, required this.roomData});

  @override
  _StayPageState createState() => _StayPageState();
}

class _StayPageState extends State<StayDetailPage> {
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
                stars: widget.stayData.starCount.toInt(),
                comment: widget.stayData.comment,
              ),
              // 편의 시설 섹션
              AmenitySection(),
              // 객실 선택 섹션
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
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
              SizedBox(height: gap_s),
              Divider(),
              SizedBox(height: gap_s),
              // 이용정보 섹션
              Text(
                '이용 정보',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              Text(
                widget.stayData.notice,
              ),
              SizedBox(height: gap_s),
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
              SizedBox(height: gap_s),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'up_button',
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true,
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
          ),
          SizedBox(height: 1),
          FloatingActionButton(
            heroTag: 'down_button',
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true,
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ),
        ],
      ),
    );
  }
}