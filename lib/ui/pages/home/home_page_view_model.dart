import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/main.dart';

class SaleStayListModel {
  List<Stay> stay;

  SaleStayListModel(this.stay);
}

class SaleStayListViewModel extends StateNotifier<SaleStayListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  SaleStayListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    // 통신하기
    ResponseDTO responseDTO = await StayRepository().fetchHomeStayList();
    // 상태값 갱신 (새로 new해서 넣어줘야 한다)
    // 여기는 리스트로 받아서 이렇게 설정
    state = responseDTO.body;
  }
}

final saleStayListProvider =
StateNotifierProvider<SaleStayListViewModel, SaleStayListModel?>((ref) {
  return SaleStayListViewModel(null, ref)..notifyInit();
});
