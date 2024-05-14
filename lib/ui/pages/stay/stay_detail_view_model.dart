import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/option.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/stay_image.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/main.dart';

class StayDetailModel {
  Stay stay;
  List<Room>? rooms;
  List<Review> reviews;
  List<StayImage> stayImages;
  List<Option>? options;

  StayDetailModel({
    required this.stay,
    this.rooms,
    required this.reviews,
    required this.stayImages,
    this.options,
  });
}

class StayDetailViewModel extends StateNotifier<StayDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  StayDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int stayId) async {
    // 통신하기
    ResponseDTO responseDTO = await StayRepository().fetchStayDetail(stayId);

    Logger().d(stayId);
    Logger().d(responseDTO.body);
    Logger().d(responseDTO.body.runtimeType);

    StayDetailModel? model = responseDTO.body;
    state = model;
  }
}

final stayDetailProvider =
StateNotifierProvider.family<StayDetailViewModel, StayDetailModel?, int>(
        (ref, stayId) {
      return StayDetailViewModel(null, ref)..notifyInit(stayId);
    });