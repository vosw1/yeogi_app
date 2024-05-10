import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

class ReservationListModel {
  List<Reservation> reservation;

  ReservationListModel(this.reservation);
}

class ReservationListViewModel extends StateNotifier<ReservationListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  ReservationListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    // JWT 토큰 가져오기
    SessionStore sessionStore = ref.read(sessionProvider);
    // 통신하기
    ResponseDTO responseDTO = await ReservationRepository()
        .fetchReservationList(sessionStore.accessToken!);
    state = responseDTO.body;
  }
}

final reservationListProvider =
StateNotifierProvider<ReservationListViewModel, ReservationListModel?>((ref) {
  return ReservationListViewModel(null, ref)
    ..notifyInit();
});
