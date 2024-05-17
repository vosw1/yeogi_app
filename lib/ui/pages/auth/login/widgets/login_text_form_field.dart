import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class LoginTextFormField extends StatefulWidget {
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
  State<LoginTextFormField> createState() => _LoginTextFormFieldState();
}

class _LoginTextFormFieldState extends State<LoginTextFormField> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _validate(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: gap_xx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Jalnan2TTF',
              color: Colors.redAccent,
            ),
          ),
          TextFormField(
            obscureText: widget.obscureText,
            validator: widget.validator,
            controller: widget.controller,
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
                _errorText = widget.validator!(value);
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }

  void _validate(String? value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
  }
}

