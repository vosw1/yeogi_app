import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/dtos/stay_request.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/main.dart';

class SearchStayModel {
  List<Stay> stay;

  SearchStayModel(this.stay);
}

class SearchStayViewModel extends StateNotifier<SearchStayModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SearchStayViewModel(super.state, this.ref);

  Future<void> notifyInit({
    String? stayName,
    int? person,
    String? stayAddress,
    int? roomPrice,
  }) async {
    // 통신하기
    ResponseDTO responseDTO = await StayRepository().fetchStaySearchList(
      stayName: stayName,
      person: person,
      stayAddress: stayAddress,
      roomPrice: roomPrice,
    );
    // 상태값 갱신 (새로 new해서 넣어줘야 한다)
    // 여기는 리스트로 받아서 이렇게 설정
    state = responseDTO.body;
  }
}

final searchStayProvider = StateNotifierProvider.family<SearchStayViewModel,
    SearchStayModel?, SearchStayDTO>(
  (ref, reqDTO) {
    return SearchStayViewModel(null, ref)
      ..notifyInit(
          stayAddress: reqDTO.stayAddress,
          person: reqDTO.person,
          roomPrice: reqDTO.roomPrice,
          stayName: reqDTO.stayName);
  },
);
