import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() {
  test('Fetch reservation list', () async {
    await fetchReservationListTest();
  });
}

Future<void> fetchReservationListTest() async {
  final responseDTO = await ReservationRepository().fetchReservationList(
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2ODM0MzQwLCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.ixjF-xpw55O45H0p9dscXaDatlA5ExGYD4lSaIlF9dt9kM1lQx8bRhMxOK13ZTOvemg-Uv7nWAiZCqr5bK2sJQ");

  if (responseDTO.status == 200) {
    print("예약 목록 가져오기 성공:");
    print(responseDTO.body);
  } else {
    print("예약 목록 가져오기 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
  }
}