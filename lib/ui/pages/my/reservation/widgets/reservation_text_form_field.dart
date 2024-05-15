import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yogi_project/_core/constants/phone_number_input_formatter.dart';
import 'package:yogi_project/_core/constants/size.dart';

class ReservationTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;
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
  State<ReservationTextFormField> createState() => _ReservationTextFormFieldState();
}


class _ReservationTextFormFieldState extends State<ReservationTextFormField> {

  String? _errorText;

  @override
  void initState() {
    super.initState();
    _errorText = widget.validator!(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gap_s),
            ),
            errorText: _errorText,
          ),
          onChanged: (value) {
            setState(() {
              _errorText = widget.validator!(value);
            });
          },
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            ...?widget.inputFormatters,
            if (widget.keyboardType == TextInputType.phone) // 전화번호 입력 필드에만 PhoneNumberInputFormatter 추가
              PhoneNumberInputFormatter(),
          ],
        ),
        SizedBox(height: 5),

      ],
    );
  }
}

