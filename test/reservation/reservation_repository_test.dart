import 'package:flutter_test/flutter_test.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

final Token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ3MDQ5NjA1LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.vL1r7JDbDG1p-R4JnHCSa26WqGS0zUW-Feu9k70ZpQIlX5scKQq4tsqDm7nXMNG-IorcfDPF2H0Ct4qHTe94Ag";

void main() {
  test('Delete reservation test', () async {
    await fetchReservationDetail();
  });
}

Future<void> fetchReservationDetail() async {
  final responseDTO = await ReservationRepository().fetchReservationList(Token);

  if (responseDTO.status == 200) {
    print("예약 목록 가져오기 성공:");
    print(responseDTO.body);
  } else {
    print("예약 목록 가져오기 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
  }
}