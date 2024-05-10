import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

class ReservationListViewModel extends StateNotifier<List<Reservation>> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ReservationListViewModel(mContext, this.ref) : super([]);

  Future<void> notifyInit() async {
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
    } else {
      print("예약 목록 가져오기 실패: ${responseDTO.errorMessage ?? 'No error message provided'}");
    }
  }
}

final reservationListProvider =
StateNotifierProvider<ReservationListViewModel, List<Reservation>>((ref) {
  return ReservationListViewModel(null, ref)..notifyInit();
});
