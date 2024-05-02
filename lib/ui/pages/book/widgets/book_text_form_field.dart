import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class BookTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const BookTextFormField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
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
        ),
        SizedBox(height: 5), // 간격 조절
        if (validator != null)
          Text(
            validator!(controller.text) ?? '', // null이면 빈 문자열 반환
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
