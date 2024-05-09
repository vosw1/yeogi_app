import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/ui/pages/my/book/reservation_list.dart';
import 'package:yogi_project/ui/pages/my/book/widgets/reservation_list_model.dart';

class ReservationListPage extends ConsumerWidget {
  const ReservationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(reservationListProvider);
    // Assuming 'pays' is correctly passed or defined elsewhere
    return Scaffold(
      appBar: AppBar(title: const Text('예약내역')),
      body: ReservationList(
        reservationList: model!.reservations,
        pays: pays, // Ensure this is correctly defined or passed
      ),
    );
  }
}
