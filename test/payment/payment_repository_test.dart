import 'package:dio/dio.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/repositories/payment_repository.dart';
import 'package:logger/logger.dart';

void main() async {
  // Dio 인스턴스 생성 및 설정
  final dio = Dio(BaseOptions(
    baseUrl: "http://192.168.219.110:8080",  // API 서버의 기본 주소
    contentType: "application/json; charset=utf-8",
    validateStatus: (_) => true,
  ));

  // Logger 인스턴스 생성
  final logger = Logger();

  // Repository 인스턴스 생성
  final paymentRepository = PaymentRepository(dio, logger);

  // 테스트 실행
  await fetchPaySaveTest(paymentRepository);
}

Future<void> fetchPaySaveTest(PaymentRepository paymentRepository) async {
  // 테스트에 사용될 DTO 생성
  final requestDTO = PaySaveReqDTO(
    payId: 1,  // 실제 존재하는 paymentId를 사용해야 함
    reservationId: 1,
    amount: 1000,
    way: "Credit Card",
    state: "COMPLETION",
    payAt: DateTime.now(),
  );

  // API 호출을 위한 accessToken 설정
  final accessToken = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ2OTU5Njg1LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.5xYn8esbFIgPkbtoteBFNGleVB257fCY-TzeASjmvZ9nWzrRVGel_HxPnI7wR_TdXow8UmXkZbB_Fz0j0njqAA';

  try {
    final response = await paymentRepository.fetchPaymentSave(requestDTO, accessToken);
    print("Payment Save Response: ${response.status}");
  } catch (e) {
    print("Error during payment save: $e");
  }
}
