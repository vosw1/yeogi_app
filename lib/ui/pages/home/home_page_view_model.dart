import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/main.dart';

class HomePageListModel {
  List<Stay> saleStayList;
  List<Stay> domesticStayList;
  List<Stay> overseaStayList;

  HomePageListModel({
    required this.saleStayList,
    required this.domesticStayList,
    required this.overseaStayList,
  });
}

class HomePageListViewModel extends StateNotifier<HomePageListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  HomePageListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    // 특가 숙소 가져오기
    ResponseDTO saleResponse = await StayRepository().fetchHomeStayList("sale");
    // 국내 숙소 가져오기
    ResponseDTO domesticResponse = await StayRepository().fetchHomeStayList("domestic");
    // 해외 숙소 가져오기
    ResponseDTO overseaResponse = await StayRepository().fetchHomeStayList("oversea");

    state = HomePageListModel(
      saleStayList: saleResponse.body,
      domesticStayList: domesticResponse.body,
      overseaStayList: overseaResponse.body,
    );
  }
}

final homePageStayListProvider = StateNotifierProvider<HomePageListViewModel, HomePageListModel?>((ref) {
  return HomePageListViewModel(null, ref)..notifyInit();
});
