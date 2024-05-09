import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/book_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/book.dart';

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

    if (responseDTO.success) {
      responseDTO.response = Reservation.fromJson(responseDTO.response);
      Logger().d(responseDTO.response.runtimeType);
    }
    return responseDTO;
  }
}