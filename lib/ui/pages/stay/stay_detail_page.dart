import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import '../../../data/models/room.dart';
import '../room/room_data_info.dart';
import '../room/room_detail_page.dart';

class StayDetailPage extends StatefulWidget {
  final Stay stayData;
  final Room roomData;

  StayDetailPage({required this.stayData, required this.roomData});

  @override
  _StayPageState createState() => _StayPageState();
}

class _StayPageState extends State<StayDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool isFavorite = false; // Track if the stay is favorited

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
              color: isFavorite ? Colors.redAccent : null, // Change color based on state
            ),
            onPressed: () {
              // Toggle the favorite state when the icon is pressed
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
          SizedBox(width: gap_s),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // ScrollController 전달
        child: Padding(
          padding: EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 숙소 이미지 섹션
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
              Text(
                '리뷰',
                style: h6(),
              ),
              SizedBox(height: gap_s),
              Container(
                height: 120,
                child: widget.stayData.comment.isEmpty ? SizedBox() : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1, // 하나의 코멘트로만 구성된 리스트
                  itemBuilder: (context, index) {
                    // 리뷰 정보 가져오기
                    final stars = widget.stayData.starCount;
                    final comment = widget.stayData.comment;
                    // 리뷰 카드 생성
                    return Container(
                      width: 200,
                      margin: EdgeInsets.only(right: gap_m),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(gap_s),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(gap_s),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 별점 표시
                            Row(
                              children: List.generate(stars.toInt(), (index) => Icon(Icons.star, color: Colors.amber, size: gap_m)),
                            ),
                            SizedBox(height: gap_xs),
                            // 코멘트 표시
                            Text(
                              comment,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: gap_s),
              Divider(),
              SizedBox(height: gap_s),
              // 편의 시설 섹션
              Text(
                '편의 시설',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              Row(
                children: [
                  _buildAmenityIcon(Icons.fitness_center, '피트니스'),
                  _buildAmenityIcon(Icons.spa, '사우나'),
                  _buildAmenityIcon(Icons.wifi, '와이파이'),
                  _buildAmenityIcon(Icons.smoke_free, '금연'),
                  _buildAmenityIcon(Icons.ac_unit, '에어컨'),
                  _buildAmenityIcon(Icons.kitchen, '냉장고'),
                ],
              ),
              SizedBox(height: gap_s),
              Divider(),
              SizedBox(height: gap_s),
              // 객실 선택 섹션
              Text(
                '객실 선택',
                style: h6(),
              ),
              SizedBox(height: gap_m),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
              RoomInfoWidget(roomData: widget.roomData),
              SizedBox(height: gap_s),
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
                  '객실별 취소 정책이 상이하니 객싱 상세정보에서 확인해주세요'
              ),
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
              // 버튼을 누르면 맨 위로 올라가도록 스크롤 위치를 조정
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
          ),
          SizedBox(height: 1), // 버튼 사이의 간격을 줄이기
          FloatingActionButton(
            heroTag: 'down_button',
            onPressed: () {
              // 버튼을 누르면 맨 아래로 이동하도록 스크롤 위치 조정
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            mini: true, // 버튼 크기 최소화
            backgroundColor: Colors.white,
            child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityIcon(IconData iconData, String text) {
    return Padding(
      padding: EdgeInsets.only(right: gap_s),
      child: Column(
        children: [
          Icon(iconData),
          SizedBox(height: gap_xs),
          Text(text),
        ],
      ),
    );
  }
}

