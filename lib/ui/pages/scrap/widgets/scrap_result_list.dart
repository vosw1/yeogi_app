import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_list_item.dart';

class ScrapResultList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(scrapListProvider.notifier);
    ScrapListModel? model = ref.watch(scrapListProvider);

    if(model == null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
        shrinkWrap: true,
        itemCount: model.scraps.length,
        itemBuilder: (context, index) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: 130,
            ),
            child: ScrapListItem(
              scrap: model.scraps[index],
            ),
          );
        },
      );
    }
  }
}
