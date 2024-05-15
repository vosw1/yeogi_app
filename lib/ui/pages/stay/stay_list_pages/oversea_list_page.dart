import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/oversea_stay_list_view_model.dart';

class OverseaStayListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OverseaStayListModel? model = ref.watch(overseaStayListProvider);

    if(model == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text('해외', style: h4(),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: gap_m),
          child: ListView.builder(
            itemCount: model.stay.length,
            itemBuilder: (context, index) {
              final Stay stay = model.stay[index];
              return buildListItem(context, stay, model.stay[index].stayId);
            },
          ),
        ),
      );
    }
  }

  Widget buildListItem(BuildContext context, Stay stay, int stayId) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_s, left: gap_m, right: gap_m),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StayDetailPage(stayId: stayId),
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(height: gap_xs),
            Expanded(
              flex: 1,
              child: Container(
                height: 120, // 사진의 높이
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap_s),
                  image: DecorationImage(
                    image: AssetImage("assets/${stay.imagePath}"), // 이미지 경로
                    fit: BoxFit.cover,
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
                      stay.name,
                      style: h5(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: gap_xx), // 텍스트 사이 간격
                  Text(
                    stay.address, // 숙소 위치
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: gap_s), // 텍스트 사이 간격
                  Text(
                    stay.intro, // 숙소 정보
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
