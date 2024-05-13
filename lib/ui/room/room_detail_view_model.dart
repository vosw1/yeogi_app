import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/room_option.dart';
import 'package:yogi_project/data/repositories/room_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

class RoomDetailModel {
  RoomOption roomOption;

  RoomDetailModel(this.roomOption);
}

class RoomDetailViewModel extends StateNotifier<RoomDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  RoomDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int roomId) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await RoomRepository().fetchRoomDetail(sessionStore.accessToken!, roomId);

    RoomDetailModel? model = responseDTO.body;
    state = model;
  }
}

final roomDetailProvider = StateNotifierProvider.family<RoomDetailViewModel, RoomDetailModel?, int>((ref, roomId) {
  return RoomDetailViewModel(null, ref)..notifyInit(roomId);
});
