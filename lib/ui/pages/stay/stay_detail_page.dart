import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/room.dart';

import '../../../_core/constants/style.dart';
import '../room/room_data_info.dart';

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
        title: Text('${widget.stayData.stayName}', style: h5(), maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark, color: isFavorite ? Colors.redAccent : null),
            onPressed: () => setState(() => isFavorite = !isFavorite),
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
              Image.asset('assets/images/${widget.stayData.stayImgTitle}', fit: BoxFit.cover),
              ReviewSection(stars: widget.stayData.starCount, comment: widget.stayData.comment),
              AmenitiesWidget(amenities: [
                {Icons.fitness_center: '피트니스'},
                {Icons.spa: '사우나'},
                {Icons.wifi: '와이파이'},
                {Icons.smoke_free: '금연'},
                {Icons.ac_unit: '에어컨'},
                {Icons.kitchen: '냉장고'},
              ]),
              RoomInfoWidget(roomData: widget.roomData),
              Text(widget.stayData.stayInfo),
              Text(widget.stayData.notice),
            ],
          ),
        ),
      ),
      floatingActionButton: ScrollFAB(controller: _scrollController),
    );
  }
}
