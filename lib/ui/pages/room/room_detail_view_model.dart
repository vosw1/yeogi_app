import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/room_option.dart';
import 'package:yogi_project/data/repositories/room_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/main.dart';

class RoomDetailModel {
  RoomOption roomOption;

  RoomDetailModel({required this.roomOption});
}

class RoomDetailViewModel extends StateNotifier<RoomDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  RoomDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int roomId) async {
    try {
      ResponseDTO responseDTO = await RoomRepository().fetchRoomDetail(roomId);
      Logger().d(roomId);
      Logger().d(responseDTO.body);
      Logger().d(responseDTO.body.runtimeType);

      RoomDetailModel? model = RoomDetailModel(roomOption: responseDTO.body);
      state = model;
    } catch (e) {
      Logger().e('Error fetching room detail: $e');
      // 예외가 발생했을 때 state를 초기화하거나 다른 처리를 할 수 있습니다.
      state = null;
    }
  }

}

final roomDetailProvider = StateNotifierProvider.family<RoomDetailViewModel, RoomDetailModel?, int>((ref, roomId) {
  return RoomDetailViewModel(null, ref)..notifyInit(roomId);

});
