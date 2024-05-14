import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/dtos/stay_request.dart';
import 'package:yogi_project/ui/pages/search/search_view_model.dart';
import 'package:yogi_project/ui/pages/search/widgets/search_result_item.dart';

class SearchResultList extends ConsumerWidget {
  final SearchStayDTO reqDTO;

  const SearchResultList({required this.reqDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchStayModel? model = ref.watch(searchStayProvider(reqDTO));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '결과 ${model.stay.length}건',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(), // 결과 몇 건인지를 나타내는 디바이더 추가
              SizedBox(height: gap_s), // 디바이더와 결과 목록 사이 간격 조절
              Expanded(
                child: model.stay.isEmpty
                    ? Center(
                  child: Text(
                    '검색 결과가 없습니다.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
                    : ListView.builder(
                  itemCount: model.stay.length,
                  itemBuilder: (context, index) {
                    return SearchResultItem(stay: model.stay[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
