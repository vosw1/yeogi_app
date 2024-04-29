import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class JoinTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;

  JoinTextFormField({
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText,
  });

  @override
  _JoinTextFormFieldState createState() => _JoinTextFormFieldState();
}

class _JoinTextFormFieldState extends State<JoinTextFormField> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Jalnan2TTF',
                color: Colors.redAccent,
              ),
            ),
          InkWell(
            onTap: () {
              if (widget.labelText == '생년월일') {
                _selectDate(context);
              }
            },
            child: TextFormField(
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              readOnly: widget.labelText == '생년월일',
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
              ),
              validator: (value) {
                if (widget.validator != null) {
                  return widget.validator!(value);
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = _selectedDate!.toString().split(' ')[0];
      });
    }
  }
}
