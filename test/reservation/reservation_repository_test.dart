import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() {
  test('Fetch reservation list', () async {
    await fetchReservationListTest();
  });
}

Future<void> fetchReservationListTest() async {
  final responseDTO = await ReservationRepository().fetchReservationList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2Nzk4MTQ5LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.JVEEK0AmGrS0Xwryr4GkCIRMts-7oU8BGHvIJYaKL3elf3tFM-QnH6DiCfNf-tUOO1PMW6DhzFXn7SpLgciZ1w");

  if (responseDTO.status == 200) {
    print('responseDTO.body : $responseDTO.body');
    print('responseDTO : $responseDTO');
  } else {
    print("예약내역 가져오기 실패: ${responseDTO.errorMessage ?? '에러 메시지 없음'}");
  }
}
