import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/event_my_page_banner.dart';
import 'package:yogi_project/data/models/reservation.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/reservation/reservation_detail_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';

class MyReservationPage extends ConsumerWidget {
  final User users;
  final List<EventMyPageBannerData> eventMyPageBanners;

  MyReservationPage({
    required this.users,
    required this.eventMyPageBanners,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch reservations when the widget is built
    ref.read(reservationListProvider.notifier).reservationList();

    final reservations = ref.read(reservationListProvider);

    if (reservations.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '예약내역',
            style: h4(),
          ),
        ),
        body: Center(
          child: Text(
            '예약 내역이 없습니다',
            style: h5(),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '예약내역',
            style: h4(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: gap_m),
          child: ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final Reservation reservation = reservations[index];
              return buildListItem(context, reservation);
            },
          ),
        ),
      );
    }
  }

  Widget buildListItem(BuildContext context, Reservation reservation) {
    return Padding(
      padding: const EdgeInsets.only(left: gap_m, right: gap_m),
      child: Row(
        children: [
          SizedBox(height: gap_xs),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationDetailPage(
                      reservations: reservation,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: gap_xs, left: gap_xs, right: gap_xs),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(gap_s),
                        child: Image.asset(
                          "assets/images/${reservation.roomImgTitle}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: gap_s),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reservation.stayName,
                            style: h6(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: gap_xs),
                          Text(
                            reservation.stayAddress,
                            style: subtitle1(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: gap_xs),
                          Text(
                            '체크인 : ${DateFormat('yyyy-MM-dd HH:mm').format(reservation.checkInDate)}',
                            style: TextStyle(fontSize: gap_s),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: gap_xs),
                          Text(
                            '체크아웃 : ${DateFormat('yyyy-MM-dd HH:mm').format(reservation.checkOutDate)}',
                            style: TextStyle(fontSize: gap_s),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
