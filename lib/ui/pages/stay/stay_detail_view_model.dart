import 'package:flutter/material.dart';
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

  bool isScrap = false;
  bool isLogin = false;

  StayDetailModel({
    required this.stay,
    this.rooms,
    required this.reviews,
    required this.stayImages,
    this.options,
    this.isScrap = false,
    this.isLogin = false,
  });

  // 일부 속성인 isScrap 과 isLogin을 속성을 업데이트 하기 위해 추가 (메서드의 불변성으로 인해 추가)
  StayDetailModel copyWith({
    Stay? stay,
    List<Room>? rooms,
    List<Review>? reviews,
    List<StayImage>? stayImages,
    List<Option>? options,
    bool? isScrap,
    bool? isLogin,
  }) {
    return StayDetailModel(
      stay: stay ?? this.stay,
      rooms: rooms ?? this.rooms,
      reviews: reviews ?? this.reviews,
      stayImages: stayImages ?? this.stayImages,
      options: options ?? this.options,
      isScrap: isScrap ?? this.isScrap,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}

class StayDetailViewModel extends StateNotifier<StayDetailModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  StayDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);

    // 통신하기
    ResponseDTO responseDTO = await StayRepository().fetchStayDetail(stayId);

    StayDetailModel? model = responseDTO.body;

    if (sessionUser.accessToken == null) {
      print("로그인이 되지 않았습니다");
    } else {
      print("로그인이 되었습니다");
      model!.isLogin = true;
    }

    state = model;
  }

  Future<void> notifyAdd(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // 스크랩 추가 통신
    if (sessionUser.accessToken == null) {
      print("로그인이 되지 않았습니다");
    } else {
      ResponseDTO responseDTO =
          await ScrapRepository().fetchScrap(stayId, sessionUser.accessToken!);
      if (responseDTO.status == 200) {
        print("스크랩 등록에 성공 하셨습니다");

        // 스크랩 통신 결과에서 isScrap 데이터 추출하여 모델에 반영
        bool isScrap = responseDTO.body['scrap'] ?? false;
        state = state!.copyWith(isScrap: isScrap);
      } else {
        print("스크랩 등록에 실패 하셨습니다");
      }
    }
  }

  Future<void> notifyRemove(int stayId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // 스크랩 추가 통신
    ResponseDTO responseDTO = await ScrapRepository()
        .fetchDeleteScrap(stayId, sessionUser.accessToken!);
    if(sessionUser.accessToken == null){
      print("로그인이 되지 않았습니다");
    } else{
      if (responseDTO.status == 200) {
        print("스크랩 삭제에 성공 하셨습니다");
        // 스크랩이 성공적으로 삭제되었으므로 isScrap을 false로 변경하고 상태를 업데이트합니다.
        state = state!.copyWith(isScrap: false);
      } else {
        print("스크랩 삭제에 실패 하셨습니다");
      }
    }
  }
}

final stayDetailProvider =
    StateNotifierProvider.family<StayDetailViewModel, StayDetailModel?, int>(
        (ref, stayId) {
  return StayDetailViewModel(null, ref)..notifyInit(stayId);
});
