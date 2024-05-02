import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/ui/pages/search/widgets/custom_popup_menu_button.dart';
import 'package:yogi_project/ui/pages/search/widgets/search_result_list.dart';
import 'package:yogi_project/_core/constants/size.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedPersonCount = '인원';
  String? _selectedUseType = '유형';
  String? _selectedReservationType = '예약여부';
  String? _selectedUsePrice = '희망가격';
  String? _selectedRegion = '지역'; // 추가된 지역 변수
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
                initialValue: _selectedRegion, // 지역 선택 초기값 설정
                items: ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '경기', '강원', '경남', '제주'],
                onSelected: (String value) {
                  setState(() {
                    _selectedRegion = value;
                  });
                },
                buttonText: '$_selectedRegion',
                selectedColor: Colors.redAccent,
                itemWidth: 60,
              ),
              SizedBox(width: gap_s),
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
                itemWidth: 30,
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
                itemWidth: 60,
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
                itemWidth: 70,
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
                      SizedBox(width: gap_xx),
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
                      SizedBox(width: gap_xx),
                      Text(
                        _checkOutDate != null
                            ? '체크아웃 날짜\n ${_formatDate(_checkOutDate)}'
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
        SearchResultList(searchResults: searchResults, stayData: stayData),
      ],
    );
  }
}
