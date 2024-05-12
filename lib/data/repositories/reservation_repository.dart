import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';

class ReservationRepository {
  Future<ResponseDTO> fetchReservationSave(ReservationSaveReqDTO resreqDTO,
      String accessToken, PaySaveReqDTO payReqDto) async {
    try {
      // 예약 정보 저장
      Response reservationResponse = await dio.put(
          "/api/reservation/${resreqDTO.roomId}", // 동적 roomId를 URL에 포함
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: resreqDTO.toJson());

      if (reservationResponse.statusCode == 200) {
        print("예약 성공, 결제 시작");

        // 결제 정보 저장
        var payload = payReqDto.toJson();
        payload['state'] = 'COMPLETION'; // 상태값 고정하기

        Response paymentResponse = await dio.post(
            "/api/reservation/pay/${payReqDto.payId}",
            options: Options(headers: {"Authorization": "Bearer $accessToken"}),
            data: payload);

        if (paymentResponse.statusCode == 200) {
          // 결제 성공 처리
          ResponseDTO responseDTO = ResponseDTO.fromJson(paymentResponse.data);
          responseDTO.body = Reservation.fromJson(responseDTO.body);
          return responseDTO;
        } else {
          // 결제 실패 처리
          print("결제 실패: HTTP Status Code: ${paymentResponse.statusCode}");
          throw Exception("Payment processing failed");
        }
      } else {
        // 예약 실패 처리
        print("예약 실패: HTTP Status Code: ${reservationResponse.statusCode}");
        throw Exception("Reservation failed");
      }
    } catch (e) {
      print("Error during processing: $e");
      throw Exception("Failed to process transaction");
    }
  }


  // 예약 삭제하기
  Future<ResponseDTO> deleteReservation(int payId, String accessToken) async {
    var response = await dio.put("/api/reservation/refund/${payId}",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    return responseDTO;
  }

  Future<ResponseDTO> fetchReservationList(String accessToken) async {
    final response = await dio.get(
      "/api/my-reservations",
      options: Options(headers: {"Authorization": "$accessToken"}),
    );

    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.body as List<dynamic>;
      List<Reservation> reservations =
      temp.map((e) => Reservation.fromJson(e)).toList();
      responseDTO.body =
          reservations; // Update the body to be the list of reservations

      for (var reservation in reservations) {
        print('데이터 확인 : ${reservation.toString()}');
      }
    } else {
      print("예약내역 조회하기 실패");
    }
    return responseDTO;
  }
}