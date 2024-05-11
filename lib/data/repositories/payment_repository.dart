

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/payment_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/payment.dart';

class PaymentRepository {
  final Dio dio;
  final Logger logger;

  PaymentRepository(this.dio, this.logger);

  // 결제하기
  Future<ResponseDTO> fetchPaymentSave(PaymentSaveReqDTO reqDTO, String accessToken) async {
    try {
      Response response = await dio.put(
          "/api/reservation/${reqDTO.paymentId}", // 동적 paymentId를 URL에 포함
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: reqDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      logger.d("HTTP Status Code: ${response.statusCode}");
      logger.d("Response Data: ${response.data}");

      if (responseDTO.status == 200) {
        responseDTO.body = Payment.fromJson(responseDTO.body);
      }
      return responseDTO;
    } catch (e) {
      logger.e("An error occurred during payment save: $e");
      throw Exception('Failed to save payment');
    }
  }

  // 결제 상태를 환불로 변경하기
  Future<ResponseDTO> updatePaymentStatusToRefund(int payId, String accessToken) async {
    try {
      Response response = await dio.put("/api/reservation/refund/${payId}",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        logger.d("HTTP Status Code: ${response.statusCode}");
        logger.d("Response Data: ${response.data}");
        return responseDTO;
      } else {
        throw Exception('Server responded with error code: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('An error occurred during updating payment status to refund: $e');
      throw Exception('Failed to update payment status to refund');
    }
  }
}
