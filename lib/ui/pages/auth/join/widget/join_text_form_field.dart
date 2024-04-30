import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class JoinTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final Function(DateTime)? onDateSelected; // 선택한 날짜에 대한 콜백

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
  String? _errorText;

  @override
  void initState() {
    super.initState();
    // validator 함수를 호출하여 초기 에러 메시지 설정
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
              }
            },
            child: TextFormField(
              keyboardType: widget.labelText == '생년월일'
                  ? TextInputType.text
                  : widget.keyboardType,
              controller: widget.controller,
              // readOnly: true, // 키보드 입력 방지
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
                errorText: _errorText, // 에러 메시지 표시
              ),
              validator: (value) {
                // 유효성 검사를 widget.validator 함수에 위임하고 반환된 에러 메시지를 사용
                setState(() {
                  _errorText = widget.validator!(value); // 에러 메시지 설정
                });
                return null; // validator 콜백은 항상 null을 반환
              },
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

  // 생년월일 선택 기능 추가
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
        // 부모 위젯에 선택한 날짜 알림
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_selectedDate!);
        }
      });
    }
  }
}
