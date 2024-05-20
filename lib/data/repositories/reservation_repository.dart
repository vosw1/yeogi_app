import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/pay.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class ReservationRepository {

  // 방별 예약 불가능한 날짜 조회하기
  Future<List<DateTime>> fetchReservedDates(int roomId) async {
    final response = await dio.get(
      "/room/detail/$roomId/calendar",
    );

    if (response.statusCode == 200) {
      List<dynamic> dates = response.data['body'];
      List<DateTime> reservedDates = dates.expand((dateRange) {
        DateTime checkIn = DateTime.parse(dateRange['checkInDate']);
        DateTime checkOut = DateTime.parse(dateRange['checkOutDate']);
        return List<DateTime>.generate(
          checkOut.difference(checkIn).inDays,
              (index) => checkIn.add(Duration(days: index)),
        );
      }).toList();
      return reservedDates;
    } else {
      throw Exception("Failed to load reserved dates");
    }
  }

  // 예약 내역보기
  Future<ResponseDTO> fetchReservationDetail(int reservationId, String accessToken) async {
    final response = await dio.get(
      "/api/my-reservations/${reservationId}",
      options: Options(headers: {"Authorization": "$accessToken"}),
    );

    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      // 예약 파싱
      final reservationContents = responseDTO.body['reservationContents'];
      Reservation reservation = Reservation.fromJson(reservationContents['reservation']);

      // 결제 파싱
      final payContents = responseDTO.body['payContents'];
      Pay pay = Pay.fromJson(payContents['pay']);

      responseDTO.body = ReservationDetailModel(
        reservation: reservation, pay: pay,
      );
      Logger().d(responseDTO.body);
    }

    return responseDTO;
  }

  // 예약하기
  Future<ResponseDTO> fetchReservationSave(ReservationSaveReqDTO reqDTO,
      String accessToken) async {
    final response =
    await dio.post("/api/reservation/${reqDTO.roomId}", // 동적 roomId를 URL에 포함
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        data: reqDTO.toJson());

    return ResponseDTO.fromJson(response.data);
  }

  // 예약 삭제하기
  Future<ResponseDTO> fetchdeleteReservation(int payId, String accessToken) async {
    var response = await dio.put("/api/reservation/refund/${payId}",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    return responseDTO;
  }

  // 예약내역 조회하기
  Future<ResponseDTO> fetchReservationList(String accessToken) async {
    final response = await dio.get(
      "/api/my-reservations",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    );

    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body as List<dynamic>;
      List<Reservation> reservations =
      temp.map((e) => Reservation.fromJson(e)).toList();
      responseDTO.body = reservations; // Update the body to be the list of reservations

      for (var reservation in reservations) {
        print('데이터 확인 : ${reservation.toString()}');
      }
    } else {
      print("예약내역 조회하기 실패");
    }
    return responseDTO;
  }
}