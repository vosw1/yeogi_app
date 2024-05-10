import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() async {
  await fetchReservationList_test();
}

Future<void> fetchReservationList_test() async {
  final responseDTO = await ReservationRepository().fetchReservationList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NzU1NDY5LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.cbxwKD7KIGymVHvF7iGLy_vBRqvdSG1lZkl8cyBSf8Qb16vCPrLYMjE4w8nvPPZgqIiIezN3hcGBjXJDbWdeRQ");

  if (responseDTO.status == 200) {
    print("예약 목록 가져오기 성공:");
    print(responseDTO.response);
  } else {
    print("예약 목록 가져오기 실패: ${responseDTO.errorMessage}");
  }
}
