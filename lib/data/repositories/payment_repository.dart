import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';

class PaymentRepository {
  final Dio dio;
  final Logger logger;

  PaymentRepository(this.dio, this.logger);

  // Saves payment details to the server
  Future<ResponseDTO> fetchPaySave(PaySaveReqDTO reqDTO, String accessToken) async {
    try {
      Response response = await dio.post(
          "/api/reservation/payment/${reqDTO.payId}",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: reqDTO.toJson());

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

  // Deletes or updates a reservation to 'refund' status
  Future<ResponseDTO> fetchPayUpdate(int payId, String accessToken) async {
    try {
      Response response = await dio.put(
          "/api/reservation/refund/$payId",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      logger.d("HTTP Status Code: ${response.statusCode}");
      logger.d("Response Data: ${response.data}");

      if (response.statusCode != 200) {
        logger.d("Failed to refund reservation.");
        // Depending on the API, you might want to handle specific status codes here.
      }
      return responseDTO;
    } catch (e) {
      logger.e("Error in refundReservation: $e");
      throw Exception('Failed to update reservation to refund');
    }
  }
}