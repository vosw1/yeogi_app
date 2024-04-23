import 'package:flutter/material.dart';

import '../serch_page/search_result)list.dart';
import '../size.dart';

// 검색 페이지 기본 틀
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

// todo : 검색 기능 구현하기
class _SearchPageState extends State<SearchPage> { // 검색 필터
  String? _selectedPersonCount = '인원';
  String? _selectedUseType = '유형';
  String? _selectedReservationType = '예약여부';
  String? _selectedUsePrice = '희망가격';
  List<String> searchResults = [];

  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  String _searchText = '';

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${_addLeadingZero(date.month)}-${_addLeadingZero(date.day)}';
  }

  String _addLeadingZero(int number) {
    if (number < 10) {
      return '0$number';
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: gap_l, left: gap_m, right: gap_m),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: '지역, 숙소를 검색하세요',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchResults = [];
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Row(
            children: [
              SizedBox(width: gap_xs),
              CustomPopupMenuButton(
                initialValue: _selectedPersonCount,
                items: ['1명', '2명', '3명', '4명+'],
                onSelected: (String value) {
                  setState(() {
                    _selectedPersonCount = value;
                  });
                },
                buttonText: '$_selectedPersonCount',
                selectedColor: Colors.redAccent,
                itemWidth: 30, // 각 팝업 메뉴 아이템의 너비 조절
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedUseType,
                items: ['숙박', '대실'],
                onSelected: (String value) {
                  setState(() {
                    _selectedUseType = value;
                  });
                },
                buttonText: '$_selectedUseType',
                selectedColor: Colors.redAccent,
                itemWidth: 30, // 각 팝업 메뉴 아이템의 너비 조절
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedReservationType,
                items: ['예약가능', '예약불가'],
                onSelected: (String value) {
                  setState(() {
                    _selectedReservationType = value;
                  });
                },
                buttonText: '$_selectedReservationType',
                selectedColor: Colors.redAccent,
                itemWidth: 60, // 각 팝업 메뉴 아이템의 너비 조절
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedUsePrice,
                items: ['5만원이하', '10만원이하', '10먄원이상'],
                onSelected: (String value) {
                  setState(() {
                    _selectedUsePrice = value;
                  });
                },
                buttonText: '$_selectedUsePrice',
                selectedColor: Colors.redAccent,
                itemWidth: 70, // 각 팝업 메뉴 아이템의 너비 조절
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _checkInDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _checkInDate) {
                      setState(() {
                        _checkInDate = picked;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.redAccent, size: 24),
                      SizedBox(width: 8),
                      Text(
                        _checkInDate != null
                            ? ' 체크인 날짜\n ${_formatDate(_checkInDate)}'
                            : '체크인 날짜',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: gap_m),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _checkOutDate ?? DateTime.now(),
                      firstDate: _checkOutDate ?? DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _checkOutDate) {
                      setState(() {
                        _checkOutDate = picked;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.redAccent, size: 24),
                      SizedBox(width: 8),
                      Text(
                        _checkOutDate != null
                            ? ' 체크아웃 날짜\n ${_formatDate(_checkOutDate)}'
                            : '체크아웃 날짜',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: gap_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '결과 ${searchResults.length}건',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: gap_xx),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ],
          ),
        ),
        SearchResultList(searchResults: searchResults),
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
  final double itemWidth; // 팝업 메뉴 아이템의 너비

  const CustomPopupMenuButton({
    Key? key,
    required this.initialValue,
    required this.items,
    required this.onSelected,
    required this.buttonText,
    required this.selectedColor,
    required this.itemWidth, // 추가된 itemWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu(
          context: context,
          position: position,
          items: items.map((String item) {
            String label;
            switch (item) {
              case '인원':
                label = '인수 유형';
                break;
              case '유형':
                label = '기기';
                break;
              case '예약여부':
                label = '예약 가능 여부';
                break;
              default:
                label = item;
                break;
            }
            return PopupMenuItem<String>(
              value: item,
              child: SizedBox(
                width: itemWidth, // 각 팝업 메뉴 아이템의 너비 조절
                child: Text(label),
              ),
            );
          }).toList(),
        ).then((value) {
          if (value != null) {
            onSelected(value);
          }
        });
      },
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonText == initialValue ? Colors.white : null,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: buttonText == initialValue
            ? MaterialStateProperty.all<Color>(selectedColor)
            : null,
      ),
    );
  }
}
