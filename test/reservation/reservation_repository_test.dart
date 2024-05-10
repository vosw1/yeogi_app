import 'package:yogi_project/data/dtos/reservaion_request.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

void main() async {
  await fetchReservationSaveTest();
}

Future<void> fetchReservationSaveTest() async {
  // given
  ReservationSaveReqDTO requestDTO = ReservationSaveReqDTO(
    roomId: '1',
    location: '부산광역시 진구',
    roomName: 'Deluxe',
    roomImgTitle: 'room1.png',
    price: 142000,
    checkInDate: DateTime.parse("2024-06-24"), // 문자열을 DateTime 객체로 변환
    checkOutDate: DateTime.parse("2024-06-26"), // 문자열을 DateTime 객체로 변환
    reservationName: "설동훈",
    reservationTel: "11111111111",
  );
  // accessToken 추가
  String accessToken =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2Nzc0NTc0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.EuUOAo3CwFsy-Z_hTnEPYh_Ms8-8wM2O_V2bKGyl2nvWZ_-PzkspmukGfyHNfYlukoq2r4aA_mKWSX9Z5GBmTg';

  // Send join request with accessToken
  final response = await ReservationRepository()
      .fetchReservationSave(requestDTO, accessToken);

  // Log response
  print("BookSave Response: $response");
}