import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class JoinTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool? obscureText; // 수정된 부분: 비밀번호 부분을 *로 표시하기 위한 속성 추가
  final Function(DateTime)? onDateSelected;
  final Function()? onAddressSearch;

  JoinTextFormField({
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText, // 수정된 부분: 비밀번호 부분을 *로 표시하기 위한 속성 추가
    this.onDateSelected,
    this.onAddressSearch,
  });

  @override
  _JoinTextFormFieldState createState() => _JoinTextFormFieldState();
}

class _JoinTextFormFieldState extends State<JoinTextFormField> {
  DateTime? _selectedDate;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _errorText = widget.validator!(widget.controller.text);
  }

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
              } else if (widget.labelText == '주소' && widget.onAddressSearch != null) {
                widget.onAddressSearch!(); // 수정된 부분: 주소 검색 기능을 위한 콜백 호출
              }
            },
            child: TextFormField(
              keyboardType: widget.labelText == '생년월일'
                  ? TextInputType.text
                  : widget.keyboardType,
              controller: widget.controller,
              obscureText: widget.obscureText ?? false, // 수정된 부분: 비밀번호 부분을 *로 표시
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
              validator: (value) {
                setState(() {
                  _errorText = widget.validator!(value);
                });
                return null;
              },
              onTap: () {
                if (widget.labelText == '생년월일') {
                  _selectDate(context);
                } else if (widget.labelText == '주소' && widget.onAddressSearch != null) {
                  widget.onAddressSearch!(); // 수정된 부분: 주소 검색 기능을 위한 콜백 호출
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
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_selectedDate!);
        }
      });
    }
  }
}