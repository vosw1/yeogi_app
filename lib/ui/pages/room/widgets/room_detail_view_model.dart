import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/data/repositories/reservation_repository.dart';

class RoomDetailViewModel extends StateNotifier<List<DateTime>> {
  final Ref ref;
  final logger = Logger();

  RoomDetailViewModel(this.ref) : super([]);

  Future<void> fetchReservedDates(int roomId) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    try {
      List<DateTime> dates = await ReservationRepository().fetchReservedDates(roomId);
      state = dates;
    } catch (e) {
      logger.e(e.toString());
    }
  }
}

final reservedDatesProvider = StateNotifierProvider.family<RoomDetailViewModel, List<DateTime>, int>((ref, roomId) {
  return RoomDetailViewModel(ref);
});
