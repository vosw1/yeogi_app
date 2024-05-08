import 'package:yogi_project/data/repositories/stay_repository.dart';

void main() async {
  await fetchStayList_test();
}

Future<void> fetchStayList_test() async {
  await StayRepository().fetchStayList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NjgzNjI0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.IpJny3pG_2pFX3pq7v_wa5ODFRk5WRZSGjL41p_gmRWyVDeilZZRh1KhbQlG4Id0sODO79-k7hCojxfsDh8ZkA");
}
