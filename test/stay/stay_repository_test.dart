import 'package:yogi_project/data/repositories/stay_repository.dart';

void main() async {
  // await fetchStaySearchList_test(); // 검색 테스트
  // await fetchSaleStayList_test(); // 특가 숙소 리스트
  await fetchOverseaStayList_test(); // 해외 숙소 리스트
  // await fetchHomeStayList_test(); // 홈 페이지 리스트
}

// 검색 테스트
Future<void> fetchStaySearchList_test() async {
  await StayRepository().fetchStaySearchList();
}

// 특가 숙소 리스트
Future<void> fetchSaleStayList_test() async {
  await StayRepository().fetchSaleStayList();
}

// 해외 숙소 리스트
Future<void> fetchOverseaStayList_test() async {
  await StayRepository().fetchSaleStayList();
}

// 홈 페이지 리스트
Future<void> fetchHomeStayList_test() async {
  await StayRepository().fetchHomeStayList();
}