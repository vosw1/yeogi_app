import 'package:yogi_project/data/repositories/stay_repository.dart';

void main() async {
  await fetchStaySearchList_test();
  // await fetchHomeStayList_test();
  await fetchSpecialStayList_test();
}

// 검색 테스트
Future<void> fetchStaySearchList_test() async {
  await StayRepository().fetchStaySearchList();
}

// 특가 숙소 리스트
Future<void> fetchSpecialStayList_test() async {
  await StayRepository().fetchSaleStayList();
}

// 홈 페이지 리스트
Future<void> fetchHomeStayList_test() async {
  await StayRepository().fetchHomeStayList();
}