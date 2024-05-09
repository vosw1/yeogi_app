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
      : super(state);

  // 예약 목록 가져오기
  Future<void> fetchReservationList() async {
    try {
      // 로딩 상태를 나타내는 값을 null 대신에 지정
      state = null;

      SessionStore sessionStore = ref.read(sessionProvider);
      String jwt = sessionStore.accessToken!;

      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text('예약 목록을 가져오는 중...')),
      );

      ResponseDTO responseDTO =
      (await ReservationRepository().fetchReservationList(jwt)) as ResponseDTO;

      if (responseDTO.status == 200) {
        List<dynamic> reservationData = responseDTO.body['reservations'];
        List<Reservation> reservations =
        reservationData.map((data) => Reservation.fromJson(data)).toList();
        state = ReservationListModel(reservations: reservations);
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(
              content: Text("예약 목록을 가져오는 데 실패했습니다: ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      Logger().e("Failed to fetch reservation list: $e");
    }
  }

  // 예약 삭제
  Future<void> deleteReservation(
      int reservationId) async {
    try {
      SessionStore sessionStore = ref.read(sessionProvider);
      String jwt = sessionStore.accessToken!;

      ResponseDTO responseDTO =
      await ReservationRepository().deleteReservation(reservationId, jwt);

      if ((responseDTO.status == 200) && responseDTO.body != null) {
        // API 응답 데이터를 리스트로 변환
        List<dynamic> temp = responseDTO.body as List<dynamic>;
        print('API 응답 데이터를 리스트로 변환');
        // 예약 목록 데이터로 변환
        List<Reservation> reservations =
        temp.map((e) => Reservation.fromJson(e)).toList();
        print('예약 목록 데이터로 변환');
        // 예약 목록 데이터를 ReservationListModel으로 감싸기
        ReservationListModel reservationListModel =
        ReservationListModel(reservations: reservations);
        print('예약 목록 데이터를 ReservationListModel으로 감싸기');
        // ResponseDTO에 예약 목록 데이터 설정
        responseDTO.body = reservationListModel;
        print('ResponseDTO에 예약 목록 데이터 설정');
      } else {
        print("Failed to load reservations or no reservations found.");
      }
    } catch (e) {
      Logger().e("Failed to delete reservation: $e");
    }
  }
}

// 예약 목록 관리자
final reservationListProvider = StateNotifierProvider<ReservationListViewModel, ReservationListModel?>((ref) {
  final BuildContext mContext = navigatorKey.currentContext!;
  final viewModel = ReservationListViewModel(mContext, ref);
  viewModel.fetchReservationList();
  return viewModel;
});


