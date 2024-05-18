import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_list_item.dart';

class ScrapResultList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(scrapListProvider.notifier);
    ScrapListModel? model = ref.watch(scrapListProvider);

    if (model == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.notifyInit();
      });

      // Return the login required message directly in the widget tree
      return Center(
        child: Text(
          '로그인을 먼저 해주세요.',
          style: TextStyle(fontSize: 20),
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
          ),
        );
      },
    );
  }
}
