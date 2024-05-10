import 'package:flutter/cupertino.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/_core/utils/validator_util.dart';
import 'package:yogi_project/ui/pages/my/reservation/widgets/reservation_text_form_field.dart';

class UserInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;

  UserInfoForm({required this.nameController, required this.phoneNumberController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("예약자 정보", style: h5()),
        SizedBox(height: gap_m),
        ReservationTextFormField(
          controller: nameController,
          labelText: '이름',
          hintText: "이름을 입력하세요",
          validator: validateName,
        ),
        SizedBox(height: gap_s),
        ReservationTextFormField(
          controller: phoneNumberController,
          labelText: '전화번호',
          hintText: '000-0000-0000',
          keyboardType: TextInputType.phone,
          validator: validatePhoneNumber,
        ),
      ],
    );
  }
}
