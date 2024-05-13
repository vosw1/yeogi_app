import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/dtos/stay_request.dart';
import 'package:yogi_project/ui/pages/search/widgets/custom_popup_menu_button.dart';
import 'package:yogi_project/ui/pages/search/widgets/search_result_list.dart';

class SearchPage extends StatefulWidget {
  final SearchStayDTO? reqDTO;

  SearchPage({this.reqDTO});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedPersonCount = '인원';
  String? _selectedUsePrice = '희망가격';
  String? _selectedRegion = '지역';
  String? _searchText = '지역, 숙소를 검색하세요';

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
                _searchText = value; // 입력된 값 저장
              });
            },
            decoration: InputDecoration(
              hintText: '지역, 숙소를 검색하세요',
              counterText: _searchText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(gap_s),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _startSearch(); // 검색 시작
                },
              ),
            ),
          ),
        ),
        SizedBox(height: gap_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_m),
          child: Row(
            children: [
              SizedBox(width: gap_xs),
              CustomPopupMenuButton(
                initialValue: _selectedRegion,
                items: [
                  '서울',
                  '부산',
                  '대구',
                  '인천',
                  '광주',
                  '대전',
                  '울산',
                  '경기',
                  '강원',
                  '경남',
                  '제주'
                ],
                onSelected: (String value) {
                  setState(() {
                    _selectedRegion = value;
                    if (widget.reqDTO != null) {
                      widget.reqDTO!.stayAddress = value;
                    }
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
                    if (widget.reqDTO != null) {
                      widget.reqDTO!.person = int.parse(
                          value.replaceAll('명', '').replaceAll('+', ''));
                    }
                  });
                },
                buttonText: '$_selectedPersonCount',
                selectedColor: Colors.redAccent,
                itemWidth: 30,
              ),
              SizedBox(width: gap_s),
              CustomPopupMenuButton(
                initialValue: _selectedUsePrice,
                items: ['5만원 이하', '10만원 이하', '15만원 이하', '20만원 이하'],
                onSelected: (String value) {
                  setState(() {
                    _selectedUsePrice = value;
                    // 수정된 부분: 가격 범위에 따라 값을 설정하도록 변경
                    if (widget.reqDTO != null) {
                      if (value == '5만원 이하') {
                        widget.reqDTO!.roomPrice = 50000;
                      } else if (value == '10만원 이하') {
                        widget.reqDTO!.roomPrice = 100000;
                      } else if (value == '15만원 이하') {
                        widget.reqDTO!.roomPrice = 150000;
                      } else if (value == '20만원 이하'){
                        widget.reqDTO!.roomPrice = 200000;
                      } else {
                        widget.reqDTO!.roomPrice = 1000000;
                      }
                    }
                  });
                },
                buttonText: '$_selectedUsePrice',
                selectedColor: Colors.redAccent,
                itemWidth: 70,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _startSearch() {
    // 검색 결과를 SearchResultList 위젯에 전달
    print("검색 버튼 누름");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SearchResultList(searchResultList: widget.reqDTO),
    ));
  }
}
