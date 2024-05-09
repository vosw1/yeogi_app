import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/dtos/user_request.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';
import 'package:yogi_project/data/repositories/user_repository.dart';

void main() async {
  await fetchBookSaveTest();
}

Future<void> fetchBookSaveTest() async {
  // given
  ReservationSaveReqDTO requestDTO = ReservationSaveReqDTO(
    roomId: '1',
    location: '부산광역시 진구',
    roomName: 'Deluxe',
    roomImgTitle: 'room1.png',
    price: 142000,
    checkInDate: DateTime.parse("2024-06-12"), // 문자열을 DateTime 객체로 변환
    checkOutDate: DateTime.parse("2024-06-14"), // 문자열을 DateTime 객체로 변환
    reservationName: "설동훈",
    reservationTel: "11111111111",
  );
  // accessToken 추가
  String accessToken =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2NzQ5ODk0LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.BehDpuP-M26tLrPE7m_s_2lE_7WExfSWQKD_c2wMxtl7yOTAfj1Fwe7puRznj5AcwgO50oq4VNfYfYK5oN8Jaw';

  // Send join request with accessToken
  final response = await ReservationRepository()
      .fetchReservationSave(requestDTO, accessToken);

  // Log response
  print("BookSave Response: $response");
}
