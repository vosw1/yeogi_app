import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_list_item.dart';

class ScrapResultList extends ConsumerWidget {
  const ScrapResultList(); // 생성자 추가

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(scrapListProvider.notifier); // ScrapListViewModel 가져오기
    ScrapListModel? model = ref.watch(scrapListProvider);

    if(model == null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 화면이 그려진 후에 notifyInit 메서드 호출하여 통신 수행
        viewModel.notifyInit();
      });
    }

    if (model == null) {
      return Center(
        child: Text(
          "찜 목록이 비어있습니다",
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: model.scraps.length,
        itemBuilder: (context, index) {
          return ScrapListItem(
            scrap: model.scraps[index],
          ); // ScrapListItem 호출하여 Scrap 데이터 전달
        },
      );
    }
  }
}
