import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';

class PayRepository {
  final Logger logger;

  PayRepository(Logger logger)
      : logger = logger;

  // 결제하기
  Future<ResponseDTO> fetchPaySave(PaySaveReqDTO reqDTO, String accessToken) async {
    try {
      print("결제 시작");
      var payload = reqDTO.toJson();
      payload['state'] = 'COMPLETION'; // 상태값 고정하기

      Response response = await dio.put(
          "/api/reservation/pay/${reqDTO.payId}",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: payload
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      logger.d("HTTP Status Code: ${response.statusCode}");
      logger.d("Response Data: ${response.data}");

      if (responseDTO.status == 200) {
        logger.d("Reservation saved successfully.");
      }
      return responseDTO;
    } catch (e) {
      logger.e("Error in saving reservation: $e");
      throw Exception('Failed to save reservation');
    }
  }

  // 결제 환불요청하기
  Future<ResponseDTO> fetchPayUpdate(int payId, String accessToken) async {
    try {
      var payload = {'state': 'REFUND'}; // 상태값 고정하기

      Response response = await dio.put(
          "/api/reservation/refund/$payId",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: payload
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      logger.d("HTTP Status Code: ${response.statusCode}");
      logger.d("Response Data: ${response.data}");

      return responseDTO;
    } catch (e) {
      logger.e("Error in fetchPayUpdate: $e");
      throw Exception('Failed to update reservation to refund');
    }
  }
}
