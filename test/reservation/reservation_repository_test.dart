import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() {
  test('fetchReservedDates returns list of reserved dates', () async {
    final roomId = 1;
    final reservationRepository = ReservationRepository();

    try {
      final reservedDates = await reservationRepository.fetchReservedDates(roomId);

      expect(reservedDates, isNotEmpty);
      print("예약 목록 가져오기 성공:");
      for (var date in reservedDates) {
        print(date);
      }
    } catch (e) {
      print("예약 목록 가져오기 실패: $e");
      fail("예약 목록 가져오기 실패");
    }
  });

  test('fetchReservedDates throws an exception on error', () async {
    final roomId = -1; // 유효하지 않은 roomId로 테스트
    final reservationRepository = ReservationRepository();

    try {
      await reservationRepository.fetchReservedDates(roomId);
      fail("예약 목록 가져오기에 실패해야 합니다.");
    } catch (e) {
      print("예약 목록 가져오기 실패 (예상된 오류): $e");
      expect(e, isA<Exception>());
    }
  });
}
