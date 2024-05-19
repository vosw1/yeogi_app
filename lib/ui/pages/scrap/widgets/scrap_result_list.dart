import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_list_item.dart';

import 'package:yogi_project/ui/pages/auth/login/login_page.dart';

class ScrapResultList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(scrapListProvider.notifier);
    ScrapListModel? model = ref.watch(scrapListProvider);

    // 초기 데이터 로딩
    if (model == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.notifyInit();
      });

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '로그인을 먼저 해주세요.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: gap_l),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    '로그인 페이지로 이동',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.scraps.length,
      itemBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: 130,
          ),
          child: ScrapListItem(
            scrap: model.scraps[index],
            onScrapChanged: () {
              viewModel.notifyInit(); // 스크랩 변경 시 목록 갱신
            },
          ),
        );
      },
    );
  }
}
