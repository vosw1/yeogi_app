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
    _errorText = widget.validator?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Jalnan2TTF',
            color: Colors.redAccent,
          ),
        ),
        SizedBox(height: gap_xs),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorText: _errorText,
          ),
          onChanged: (value) {
            setState(() {
              _errorText = widget.validator?.call(value);
            });
          },
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            LengthLimitingTextInputFormatter(13),
            ...?widget.inputFormatters,
            if (widget.keyboardType == TextInputType.phone)
              PhoneNumberInputFormatter(),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
