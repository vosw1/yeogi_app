import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/option.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/stay_image.dart';
import 'package:yogi_project/data/repositories/scrap_repository.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/data/store/session_store.dart';
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

  Future<void> notifyAdd(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await ScrapRepository().fetchScrap(stayId, sessionUser.accessToken!);

    if(responseDTO.status == 200){
      print("스크랩 등록에 성공 하셨습니다");
    }else{
      print("스크랩 등록에 실패 하셨습니다");
    }
  }

  Future<bool> notifyScrapColor(int stayId) async {
    return true;
  }
}

final stayDetailProvider =
StateNotifierProvider.family<StayDetailViewModel, StayDetailModel?, int>(
        (ref, stayId) {
      return StayDetailViewModel(null, ref)..notifyInit(stayId);
    });