import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/scrap.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

// 세션 정보를 관리하는 Provider
final sessionProvider = Provider<String?>((ref) {
  // 실제 구현에서는 SharedPreferences 등에서 토큰을 가져오도록 수정 필요
  // 예시: SharedPreferences.getInstance().then((prefs) => prefs.getString('token'));
  return null; // 임시로 null 반환하여 비로그인 상태로 가정
});

class ScrapListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? token = ref.watch(sessionProvider);
    ScrapListModel? model = ref.watch(scrapListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('찜한 숙소'),
      ),
      body: token == null
          ? Center(
              child: Text(
              '로그인이 필요합니다.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ))
          : model == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: gap_m),
                  child: ListView.builder(
                    itemCount: model.scraps.length,
                    itemBuilder: (context, index) {
                      final Scrap scrap = model.scraps[index];
                      return buildListItem(context, scrap);
                    },
                  ),
                ),
    );
  }

  Widget buildListItem(BuildContext context, Scrap scrap) {
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
                    builder: (context) => StayDetailPage(stayId: scrap.id),
                  ),
                );
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/camping/camping1.png"),
                    // 이미지 경로
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    scrap.name,
                    style: h5(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  scrap.address,
                  style: subtitle1(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  scrap.intro,
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
}
