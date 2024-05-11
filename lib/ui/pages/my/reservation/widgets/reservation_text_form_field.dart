import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yogi_project/_core/constants/phone_number_input_formatter.dart';
import 'package:yogi_project/_core/constants/size.dart';

class ReservationTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const ReservationTextFormField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gap_s),
            ),
          ),
          validator: validator,
          inputFormatters: [
            ...?inputFormatters,
            if (keyboardType == TextInputType.phone) // 전화번호 입력 필드에만 PhoneNumberInputFormatter 추가
              PhoneNumberInputFormatter(),
          ],
        ),
        SizedBox(height: 5),
        if (validator != null)
          Text(
            validator!(controller.text) ?? '',
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}

