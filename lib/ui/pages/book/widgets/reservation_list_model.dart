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

  ReservationListViewModel(this.mContext, this.ref, {ReservationListModel? state})
      : super(state);

  // 예약 목록 가져오기
  Future<void> fetchReservationList() async {
    try {
      SessionStore sessionStore = ref.read(sessionProvider);
      String jwt = sessionStore.accessToken!;

      ResponseDTO responseDTO = await ReservationRepository().fetchReservationList(jwt);

      if (responseDTO.success) {
        List<dynamic> reservationData = responseDTO.response['reservations'];
        List<Reservation> reservations = reservationData.map((data) => Reservation.fromJson(data)).toList();
        state = ReservationListModel(reservations: reservations);
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text("예약 목록을 가져오는 데 실패했습니다: ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      Logger().e("Failed to fetch reservation list: $e");
    }
  }

  // 예약 삭제
  Future<void> deleteReservation(int reservationId) async {
    try {
      SessionStore sessionStore = ref.read(sessionProvider);
      String jwt = sessionStore.accessToken!;

      ResponseDTO responseDTO = await ReservationRepository().deleteReservation(reservationId, jwt);

      if (responseDTO.success) {
        // 성공적으로 삭제되었으므로 해당 예약 제거
        state = state!.copyWith(reservations: state!.reservations.where((reservation) => reservation.id != reservationId).toList());
      } else {
        ScaffoldMessenger.of(mContext).showSnackBar(
          SnackBar(content: Text("예약 삭제에 실패했습니다: ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      Logger().e("Failed to delete reservation: $e");
    }
  }
}

// 예약 목록 관리자
final reservationListProvider = StateNotifierProvider<ReservationListViewModel, ReservationListModel?>((ref) {
  final navigatorState = Navigator.of(ref.read(navigatorKey as ProviderListenable).currentContext!);
  final viewModel = ReservationListViewModel(navigatorState as BuildContext, ref);
  viewModel.fetchReservationList();
  return viewModel;
});

