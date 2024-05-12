import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 상태 관리 라이브러리 추가
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/dtos/pay_request.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart'; // 파일명 오타 수정
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/my/pay/pay_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/argreement_section.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservaion_info_form.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_list_model.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_info.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/room_notice.dart';

class ReservationPage extends ConsumerWidget {
  final Room rooms;
  String? selectedPaymentMethod;

  List<String> paymentMethods = [
    '체크카드',
    '신용카드',
    '계좌이체',
    '모바일결제'
  ];

  ReservationPage({required this.rooms});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    final selectedPaymentMethod = ref.watch(reservationListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('예약하기')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoomInfo(rooms: rooms),
              SizedBox(height: gap_m),
              RoomNotice(),
              Divider(),
              SizedBox(height: gap_s),
              ReservationInfoForm(
                nameController: _nameController,
                phoneNumberController: _phoneNumberController,
              ),
              SizedBox(height: gap_xs),
              Divider(),
              SizedBox(height: gap_xs),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: '결제 방법'),
                value: selectedPaymentMethod,
                items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(), onChanged: (Object? value) {  },
              ),
              SizedBox(height: gap_xs),
              Divider(),
              SizedBox(height: gap_s),
              AgreementSection(
                onAllChecked: (bool value) {},
                subCheckboxValues: [false, false, false, false],
                subtitles: [
                  '이용규칙 및 취소/환불 규정 동의(필수)',
                  '개인정보 수집 및 이용 동의(필수)',
                  '개인정보 제3자 제공 동의(필수)',
                  '만 14세 이상 확인(필수)',
                ],
              ),
              SizedBox(height: gap_l),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: gap_m),
                child: ElevatedButton(
                  onPressed: () => _attemptReservation(
                      context, ref, _nameController, _phoneNumberController, rooms, stays),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text(
                    '${NumberFormat('#,###').format(rooms.price)} 원 결제하기',
                    style: h6(mColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    void _attemptReservation(
      BuildContext context,
      WidgetRef ref,
      TextEditingController nameController,
      TextEditingController phoneController,
      Room rooms,
      Stay stays) {
    if ([true, true, true, true].every((val) => val)) {
      ReservationSaveReqDTO dto = ReservationSaveReqDTO(
        roomId: rooms.roomId,
        stayAdress: stays.address ?? 'defaultAddress',
        roomName: rooms.roomName ?? 'defaultRoomName',
        roomImgTitle: rooms.roomImgTitle ?? 'defaultImgTitle',
        price: (rooms.price ?? 0).toInt(),
        // Ensuring conversion to double
        checkInDate:
            DateTime.parse(rooms.checkInDate ?? DateTime.now().toString()),
        checkOutDate:
            DateTime.parse(rooms.checkOutDate ?? DateTime.now().toString()),
        reservationName: nameController.text.isNotEmpty
            ? nameController.text
            : 'Default Name',
        reservationTel: phoneController.text.isNotEmpty
            ? phoneController.text
            : 'Default Tel',
      );

      ref.read(reservationListProvider.notifier).reservationSave(dto, PaySaveReqDTO as PaySaveReqDTO);
      // 예약 정보가 성공적으로 추가된 후 결제 페이지로 네비게이션
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
               // PayPage()), // PaymentPage는 결제 페이지의 클래스입니다.
      MyReservationPage(users: users, eventMyPageBanners: eventMyPageBanners,)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Text('모든 필수 항목에 동의해주세요.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }
}
