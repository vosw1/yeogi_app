import 'package:flutter/material.dart';

import '../size.dart'; // 사용자 정의 파일 경로를 여기에 입력하세요.

class NearFromMePage extends StatefulWidget {
  @override
  _NearFromMePageState createState() => _NearFromMePageState();
}

class _NearFromMePageState extends State<NearFromMePage> {
  String? _selectedPersonCount = '1명';
  String? _selectedUseType = '숙박';
  String? _selectedUsePrice = '0원 ~ 5만원이하';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: gap_l, left: gap_m, right: gap_m),
          child: TextField(
            decoration: InputDecoration(
              hintText: '지역, 숙소를 검색하세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // 검색 기능 추가
                },
              ),
            ),
          ),
        ),
        SizedBox(height: gap_xs),
        Row(
          children: [
            SizedBox(width: gap_m),
            CustomPopupMenuButton(
              initialValue: _selectedPersonCount,
              items: ['1명', '2명', '3명', '4명+'],
              onSelected: (String value) {
                setState(() {
                  _selectedPersonCount = value;
                });
              },
              buttonText: '$_selectedPersonCount',
              selectedColor: Colors.redAccent, // 배경색을 레드 악센트로 설정
            ),
            CustomPopupMenuButton(
              initialValue: _selectedUseType,
              items: ['숙박', '대실'],
              onSelected: (String value) {
                setState(() {
                  _selectedUseType = value;
                });
              },
              buttonText: '$_selectedUseType',
              selectedColor: Colors.redAccent, // 배경색을 레드 악센트로 설정
            ),
            CustomPopupMenuButton(
              initialValue: _selectedUsePrice,
              items: ['0원 ~ 5만원이하', '5만원 ~ 10만원', '10만원 ~ 20만원', '20만원 이상'],
              onSelected: (String value) {
                setState(() {
                  _selectedUsePrice = value;
                });
              },
              buttonText: '$_selectedUsePrice',
              selectedColor: Colors.redAccent, // 배경색을 레드 악센트로 설정
            ),
          ],
        ),
      ],
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  final String? initialValue;
  final List<String> items;
  final ValueChanged<String> onSelected;
  final String buttonText;
  final Color selectedColor;

  const CustomPopupMenuButton({
    Key? key,
    required this.initialValue,
    required this.items,
    required this.onSelected,
    required this.buttonText,
    required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_s),
      child: PopupMenuButton<String>(
        onSelected: onSelected,
        itemBuilder: (BuildContext context) {
          return items.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Center(child: Text(item)),
            );
          }).toList();
        },
        child: ElevatedButton(
          onPressed: null,
          child: Text(
            buttonText,
            style: TextStyle(
                color: buttonText == initialValue ? Colors.white : null),
          ),
          style: ButtonStyle(
            backgroundColor: buttonText == initialValue ? MaterialStateProperty
                .all<Color>(selectedColor) : null,
          ),
        ),
      ),
    );
  }
}
