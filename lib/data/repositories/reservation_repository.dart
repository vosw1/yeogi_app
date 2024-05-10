import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/reservaion_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/Reservation.dart';
import 'package:yogi_project/ui/pages/book/widgets/reservation_list_model.dart';

class ReservationRepository {
  Future<ResponseDTO> fetchReservationSave(ReservationSaveReqDTO reqDTO, String accessToken) async {
    Response response = await dio.post(
        "/api/reservation/${reqDTO.roomId}", // 동적 roomId를 URL에 포함
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        data: reqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(responseDTO.response);
    print('데이터 확인 : ${responseDTO.response}');
    Logger().d(responseDTO.response.runtimeType);

    if (responseDTO.status == 200) {
      responseDTO.response = Reservation.fromJson(responseDTO.response);
      Logger().d(responseDTO.response.runtimeType);
    }
    return responseDTO;
  }

  Future<ResponseDTO> deleteReservation(int reservationId, String accessToken) async {
    var response = await dio.delete("/api/reservation/${reservationId}",
        options: Options(headers: {"Authorization": "${accessToken}"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> fetchReservationList(String accessToken) async {
    final response = await dio.get(
      "/api/my-reservations",
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      List<dynamic> temp = responseDTO.response["reservations"];
      List<Reservation> reservations = temp.map((e) => Reservation.fromJson(e)).toList();

      ReservationListModel reservaionListModel = ReservationListModel(reservations: reservations);
      responseDTO.response = reservaionListModel;
    }
    return responseDTO;
  }
}