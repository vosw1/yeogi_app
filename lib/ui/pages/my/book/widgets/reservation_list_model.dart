import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

// 예약 목록 데이터
class ReservationListModel {
  List<Reservation> reservations;

  ReservationListModel({required this.reservations});

  ReservationListModel copyWith({List<Reservation>? reservations}) {
    return ReservationListModel(
      reservations: reservations ?? this.reservations,
    );
  }
}

// 예약 목록 뷰모델
class ReservationListViewModel extends StateNotifier<ReservationListModel?> {
  final BuildContext mContext;
  final Ref ref;

  ReservationListViewModel(this.mContext, this.ref,
      {ReservationListModel? state})
      : super(state ?? ReservationListModel(reservations: []));  // 초기 상태를 비어 있는 목록으로 설정

  // JWT 토큰 가져오기
  String? _getJwtToken() {
    SessionStore sessionStore = ref.read(sessionProvider);
    return sessionStore.accessToken;
  }

  // 예약 목록 가져오기
  Future<void> fetchReservationList() async {
    Logger logger = Logger();
    String? jwt = _getJwtToken();
    if (jwt == null) {
      logger.e("Access token is null");
      return;
    }

    ScaffoldMessenger.of(mContext).showSnackBar(
      SnackBar(content: Text('예약 목록을 가져오는 중...')),
    );

    try {
      ResponseDTO responseDTO = await ReservationRepository().fetchReservationList(jwt);
      if (responseDTO.status == 200 && responseDTO.body != null) {
        List<dynamic> reservationData = responseDTO.body['reservations'];
        List<Reservation> reservations = reservationData.map((data) => Reservation.fromJson(data)).toList();
        state = ReservationListModel(reservations: reservations);
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text("예약 목록을 가져오는 데 실패했습니다: ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      logger.e("Failed to fetch reservation list: $e");
    }
  }

  // 예약 삭제
  Future<void> deleteReservation(int reservationId) async {
    Logger logger = Logger();
    String? jwt = _getJwtToken();
    if (jwt == null) {
      logger.e("Access token is null");
      return;
    }

    try {
      ResponseDTO responseDTO = await ReservationRepository().deleteReservation(reservationId, jwt);
      if (responseDTO.status == 200 && responseDTO.body != null) {
        List<dynamic> temp = responseDTO.body as List<dynamic>;
        List<Reservation> reservations = temp.map((e) => Reservation.fromJson(e)).toList();
        state = ReservationListModel(reservations: reservations);
      } else {
        logger.e("Failed to load reservations or no reservations found.");
      }
    } catch (e) {
      logger.e("Failed to delete reservation: $e");
    }
  }
}

// 예약 목록 관리자
final reservationListProvider = StateNotifierProvider<ReservationListViewModel, ReservationListModel?>((ref) {
  BuildContext mContext = navigatorKey.currentContext!;
  return ReservationListViewModel(mContext, ref);
});
