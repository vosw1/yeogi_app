import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() {
  test('Delete reservation test', () async {
    await deleteReservationTest(9);
  });
}

Future<void> deleteReservationTest(int payId) async {
  final responseDTO = await ReservationRepository().deleteReservation(
      payId,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2ODM1ODc2LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.vwiYh1k90M2cBYUunv2w_iFpx7uhxYrmnmVxiVQdnPhpp4PX4lT-XPJCI16QDfdSFDKZrUcc-gj9ya-dBGKCjQ"
  );

  if (responseDTO.status == 200) {
    print("예약 삭제 성공:");
    print(responseDTO.body);
  } else {
    print("예약 삭제 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
  }
}