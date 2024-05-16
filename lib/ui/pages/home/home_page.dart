import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/scroll_fab.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/home/home_page_view_model.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_body_banner.dart';
import 'package:yogi_project/ui/pages/home/widgets/home_header.dart';

class HomePage extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageListModel? model = ref.watch(homePageStayListProvider);

    final List<Stay> saleStayList = model?.saleStayList ?? [];
    final List<Stay> domesticStayList = model?.domesticStayList ?? [];
    final List<Stay> overseaStayList = model?.overseaStayList ?? [];

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: gap_s),
              SizedBox(height: gap_xm),
              // 상단 로고, 벨 아이콘 + 상단 아이콘
              HomeHeader(),
              SizedBox(height: gap_m),
              Container(
                width: double.infinity,
                height: 180,
                child: HomeBodyBanner(
                    eventTitleBannerDataList: eventTitleBannerDataList),
              ),
              // 이미지와 텍스트를 가로 스크롤로 구성
              SizedBox(height: gap_m),
              HomeBody(
                title: "특가 숙소",
                stays: saleStayList, // 특가 숙소 리스트 전달
              ),
              HomeBody(
                title: "국내 숙소",
                stays: domesticStayList, // 국내 숙소 리스트 전달
              ),
              HomeBody(
                title: "해외 숙소",
                stays: overseaStayList, // 해외 숙소 리스트 전달
              ),
              SizedBox(height: gap_m),
            ],
          ),
        ),
        // 맨 위, 맨 아래로 이동하는 버튼
        floatingActionButton: ScrollFAB(controller: _scrollController),
      );
    }
  }
}
