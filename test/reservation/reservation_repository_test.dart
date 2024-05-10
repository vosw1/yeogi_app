import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

final Token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2ODM5Mzc0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.mGGHbjog-nZgkLfh-jyJzwV5we20UNaOuUDK2aBc94klgv4JBEhrDYQhbKcnW3w-1kUP8WheLlyHrCKfg-x6KA";

void main() {
  test('Delete reservation test', () async {
    await fetchReservationListTest();
  });
}

Future<void> fetchReservationListTest() async {
  final responseDTO = await ReservationRepository().fetchReservationList(
      Token);

  if (responseDTO.status == 200) {
    print("예약 목록 가져오기 성공:");
    print(responseDTO.body);
  } else {
    print("예약 목록 가져오기 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
  }
}

