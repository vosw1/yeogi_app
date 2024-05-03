import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/search/widgets/search_result_item.dart';
class SearchResultList extends StatelessWidget {
  final List<Stay> searchResultList;

  const SearchResultList({required this.searchResultList, required Stay stayData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '결과 ${searchResultList.length}건',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(), // 결과 몇 건인지를 나타내는 디바이더 추가
          SizedBox(height: gap_m), // 디바이더와 결과 목록 사이 간격 조절
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
            itemCount: searchResultList.isEmpty ? 1 : searchResultList.length,
            itemBuilder: (context, index) {
              if (searchResultList.isEmpty) {
                return Center(
                  child: Text(
                    '검색 결과가 없습니다.',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else {
                final stayData = searchResultList[index];
                return SearchResultItem(stayData: stayData);
              }
            },
          ),
        ],
      ),
    );
  }
}
