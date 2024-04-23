import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

class LoginTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  LoginTextFormField({
    required this.controller,
    required this.text,
    this.obscureText = false,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: gap_xx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Jalnan2TTF',
              color: Colors.redAccent,
            ),
          ),
          TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
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
            ),
          ),
        ],
      ),
    );
  }
}
