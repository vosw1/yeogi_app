import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/_core/constants/http.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/pay.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/repositories/pay_repository.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';

class ReservationDetailModel {
  Reservation reservation;
  Pay pay;

  ReservationDetailModel({
    required this.reservation,
    required this.pay,
  });
}

class ReservationListViewModel extends StateNotifier<List<Reservation>> {
  final Ref ref;
  final logger = Logger();

  ReservationListViewModel(mContext, this.ref) : super([]);

  // 예약된 날짜 조회하기
  Future<List<DateTime>> fetchReservedDates(int roomId) async {
    return await ReservationRepository().fetchReservedDates(roomId);
  }

  // 결제 환불하기(예약취소)
  Future<void> payUpdate(int payId) async {
    String accessToken = ref.read(sessionProvider).accessToken!;

    ResponseDTO responseDTO = await ReservationRepository()
        .fetchdeleteReservation(payId, accessToken);
    if (responseDTO.status == 200) {
      logger.d("Refund processed successfully.");
    } else {
      logger.e("Failed to process refund: ${responseDTO.errorMessage}");
    }
  }

  // 결제하기
  Future<ResponseDTO> paySave(PaySaveReqDTO reqDTO) async {
    // JWT 토큰 가져오기
    SessionStore sessionStore = ref.read(sessionProvider);
    print("결제 요청 시작");

    // 결제 정보 서버로 전송
    ResponseDTO responseDTO = await PayRepository(logger)
        .fetchPaySave(reqDTO, sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      print("결제 성공: ${responseDTO.body}");
      // 서버 응답에서 새로운 예약 정보 가져오기
      Reservation newReservation = Reservation.fromJson(responseDTO.body);

      // 상태 업데이트
      state = [...state, newReservation];
    } else {
      print(
          "결제 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
    }

    return responseDTO; // 반환 값 추가
  }

  // 예약 내역보기
  Future<void> reservationList() async {
    // JWT 토큰 가져오기
    SessionStore sessionStore = ref.read(sessionProvider);
    // 통신하기
    print("통신 시작");
    ResponseDTO responseDTO = await ReservationRepository()
        .fetchReservationList(sessionStore.accessToken!);

    if (responseDTO.status == 200) {
      print("예약 목록 가져오기 성공:");
      print(responseDTO.body);

      // 예약 목록을 상태로 설정
      state = List<Reservation>.from(responseDTO.body);
      print("State updated: $state");
    } else {
      print(
          "예약 목록 가져오기 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
    }
  }

  Future<int> reservationSave(ReservationSaveReqDTO reqDTO) async {
    // JWT 토큰 가져오기
    SessionStore sessionStore = ref.read(sessionProvider);
    print("예약 요청 시작");
    print('전송할 데이터: ${reqDTO.toJson()}'); // 디버깅 코드 추가

    // 예약 정보 서버로 전송
    ResponseDTO responseDTO = await ReservationRepository()
        .fetchReservationSave(reqDTO, sessionStore.accessToken!);

    print("서버 응답 상태: ${responseDTO.status}");
    print("서버 응답 본문: ${responseDTO.body}");

    if (responseDTO.status == 200) {
      // 성공적으로 예약이 추가된 경우
      print("예약 성공: ${responseDTO.body}");
      Reservation newReservation = Reservation.fromJson(responseDTO.body);

      // 상태 업데이트
      return newReservation.reservationId; // 예약 ID 반환
    } else {
      // 예약 실패 처리
      print("예약 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
      return -1; // 실패 시 -1 반환
    }
  }
}

final reservationListProvider = StateNotifierProvider<ReservationListViewModel, List<Reservation>>((ref) {
  return ReservationListViewModel(null, ref)..reservationList();
});
