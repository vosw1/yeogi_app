import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/reservaion_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/reservation_list_model.dart';

class ReservationRepository {
  // 예약하기
  Future<ResponseDTO> fetchReservationSave(
      ReservationSaveReqDTO reqDTO, String accessToken) async {
    Response response = await dio.post(
        "/api/reservation/${reqDTO.roomId}", // 동적 roomId를 URL에 포함
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        data: reqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(responseDTO.body);
    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
    Logger().d(responseDTO.body.runtimeType);

    if (responseDTO.status == 200) {
      responseDTO.body = Reservation.fromJson(responseDTO.body);
      Logger().d(responseDTO.body.runtimeType);
    }
    return responseDTO;
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

  // 예약 내역 확인하기
  Future<ResponseDTO> fetchReservationList(String accessToken) async {
    try {
      final response = await dio.get(
        "/api/my-reservations",
        options: Options(headers: {"Authorization": accessToken}),
      );
      if (response.statusCode == 200) {
        List<Reservation> reservations = (response.data['body'] as List)
            .map((item) => Reservation.fromJson(item)).toList();
        return ResponseDTO(status: 200, body: reservations);
      } else {
        return ResponseDTO(status: response.statusCode, errorMessage: 'Error fetching reservations');
      }
    } catch (e) {
      return ResponseDTO(status: 500, errorMessage: e.toString());
    }
  }
}
