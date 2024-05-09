import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/reservaion_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/ui/pages/book/widgets/reservation_list_model.dart';

class ReservationRepository {
  // 예약하기
  Future<ResponseDTO> fetchReservationSave(ReservationSaveReqDTO reqDTO, String accessToken) async {
    Response response = await dio.post(
        "/api/reservation/${reqDTO.roomId}", // 동적 roomId를 URL에 포함
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        data: reqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(responseDTO.response);
    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
    Logger().d(responseDTO.response.runtimeType);

    if (responseDTO.success) {
      responseDTO.response = Reservation.fromJson(responseDTO.response);
      Logger().d(responseDTO.response.runtimeType);
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
    final response = await dio.get(
      "/api/my-reservations",
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );
    print("HTTP Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success && responseDTO.response != null) {
      List<dynamic> temp = responseDTO.response as List<dynamic>; // 안전하게 캐스팅
      List<Reservation> reservations = temp.map((e) => Reservation.fromJson(e)).toList();
      ReservationListModel reservationListModel = ReservationListModel(reservations: reservations);
      responseDTO.response = reservationListModel;
    } else {
      print("Failed to load reservations or no reservations found.");
    }
    return responseDTO;
  }
}