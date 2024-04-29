import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class JoinTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final Function(DateTime)? onDateSelected; // Callback for selected date

  JoinTextFormField({
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText,
    this.onDateSelected,
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
          GestureDetector(
            onTap: () {
              if (widget.labelText == '생년월일') {
                _selectDate(context);
              }
            },
            child: TextFormField(
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              readOnly: true, // Always readOnly to prevent keyboard input
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
              validator: widget.validator,
              onTap: () {
                if (widget.labelText == '생년월일') {
                  _selectDate(context);
                }
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
        // Notify the parent widget about the selected date
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_selectedDate!);
        }
      });
    }
  }
}
