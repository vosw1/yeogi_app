import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/user.dart';

import 'book/reservation_list.dart';
import 'book/widgets/reservation_list_model.dart';

class MyPage extends ConsumerWidget {
  final User users;
  final List<EventMyPageBannerData> eventMyPageBannerData;

  MyPage({
    required this.users,
    required this.eventMyPageBannerData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(reservationListProvider);
    ReservationListViewModel viewModel =
    ref.read(reservationListProvider.notifier);

    // 예약 목록이 null이거나 로딩 중일 때
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      // 데이터가 로드된 경우
      return Column(
        children: <Widget>[
          // 예약내역 타이틀
          ListTile(
            title: Text('예약내역'),
            onTap: () {},
          ),
          // 국내숙소 리스트
          ListTile(
            title: Text('숙소'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // 국내 숙소 탭 시 BookInKoreaPage로 모든 예약 데이터 목록을 전달
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ReservationList(reservationList: model.reservations),
                ),
              );
            },
          ),
        ],
      );
    }
  }
}