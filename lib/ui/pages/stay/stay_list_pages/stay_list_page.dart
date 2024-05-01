import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';
import '../../stay/stay_detail_page.dart';

abstract class StayListPage extends StatelessWidget {
  const StayListPage({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;
  List<Stay> getStayDataList();

  Widget buildListItem(BuildContext context, Stay stay) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
      child: Row(
        children: [
          SizedBox(height: gap_xs),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StayDetailPage(stayData: stay, roomData: roomData),
                  ),
                );
              },
              child: Container(
                height: 120, // 사진의 높이
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${stay.stayImgTitle}"), // 이미지 경로
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8), // 사진과 텍스트 사이 간격
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // 화면 너비에 맞추기 위해 사용
                  child: Text(
                    stay.stayName,
                    style: h5(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4), // 텍스트 사이 간격
                Text(
                  stay.location, // 숙소 위치
                  style: subtitle1(),maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4), // 텍스트 사이 간격
                Text(
                  stay.stayInfo, // 숙소 정보
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Stay> stayDataList = getStayDataList();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ListView.builder(
          itemCount: stayDataList.length,
          itemBuilder: (context, index) {
            final Stay stay = stayDataList[index];
            return buildListItem(context, stay);
          },
        ),
      ),
    );
  }
}