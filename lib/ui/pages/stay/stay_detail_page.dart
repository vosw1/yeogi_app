import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_view_model.dart';
import 'package:yogi_project/ui/pages/stay/widgets/amenities_widget.dart';
import 'package:yogi_project/ui/pages/stay/widgets/review_section.dart';
import 'package:yogi_project/ui/pages/stay/widgets/room_info_widget.dart';

class StayDetailPage extends ConsumerWidget {
  int stayId;

  StayDetailPage({required this.stayId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StayDetailModel? model = ref.watch(stayDetailProvider(stayId));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '${model.stay.stayName}',
            style: h4(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.redAccent, // 변경된 부분
              ),
              onPressed: () {},
            ),
            SizedBox(width: gap_s),
          ],
        ),
        body: SingleChildScrollView(
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
                      'assets${model.stayImages[0].stayImagePath}', // 변경된 부분
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: gap_m),
                // Review section
                ReviewSection(reviews: model.reviews),
                SizedBox(height: gap_xx),
                // 편의 시설 섹션
                AmenitySection(),
                SizedBox(height: gap_xx),
                // 객실 선택 섹션
                Text(
                  '객실 선택',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.rooms?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index != 0) SizedBox(height: gap_s),
                        // 첫 번째 요소를 제외하고 간격 추가
                        RoomInfoWidget(
                          roomData: model.rooms![index],
                          roomId: model.rooms![index].roomId,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                // 숙소 소개 섹션
                Text(
                  '숙소 소개',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  model.stay.intro, // 변경된 부분
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                Text(
                  '이용 정보',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  model.stay.information, // 변경된 부분
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
                Divider(),
                SizedBox(height: gap_s),
                // 취소 및 환불 규정 섹션
                Text(
                  '취소 및 환불 정책',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: gap_s),
                Text(
                  '객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: gap_s),
              ],
            ),
          ),
        ),
        floatingActionButton:
            ScrollFAB(controller: ScrollController()), // 변경된 부분
      );
    }
  }
}
