import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
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
  String? _searchText = '';

  SearchStayDTO defaultData =
      SearchStayDTO(stayName: '', roomPrice: 0, person: 0, stayAddress: '');
  SearchStayDTO searchResultList =
      SearchStayDTO(stayName: '', roomPrice: 0, person: 0, stayAddress: '');

  void _startSearch() {
    print("검색 버튼 누름");

    // 사용자가 입력한 값을 저장할 변수들
    String? searchText = _searchText;
    String? selectedRegion = '';
    String? selectedPersonCount = _selectedPersonCount;
    String? selectedUsePrice = '';

    if (_selectedPersonCount == "인원") {
      selectedPersonCount = "0명";
    } else {
      selectedPersonCount = _selectedPersonCount;
    }

    if (_selectedRegion == "지역") {
      selectedRegion = "";
    } else {
      selectedRegion = _selectedRegion;
    }

    // 사용자가 입력한 값을 기반으로 searchResultList 생성
    setState(() {
      searchResultList = SearchStayDTO(
        stayName: searchText ?? defaultData.stayName,
        stayAddress: selectedRegion ?? defaultData.stayAddress,
        roomPrice: _calculateRoomPrice(selectedUsePrice),
        person: _calculatePerson(selectedPersonCount),
      );
    });

    // 결과 확인을 위한 출력
    print(searchResultList.stayName);
    print(searchResultList.stayAddress);
    print(searchResultList.roomPrice);
    print(searchResultList.person);
    print(searchResultList.runtimeType);
  }

  // 선택된 가격대에 따라 roomPrice 계산
  int _calculateRoomPrice(String? selectedUsePrice) {
    switch (selectedUsePrice) {
      case '5만원 이하':
        return 50000;
      case '10만원 이하':
        return 100000;
      case '15만원 이하':
        return 150000;
      case '20만원 이하':
        return 200000;
      default:
        return 1000000; // 기본값
    }
  }

  // 선택된 인원에 따라 person 계산
  int? _calculatePerson(String? selectedPersonCount) {
    if (selectedPersonCount == null) return defaultData.person;
    if (selectedPersonCount == '4명+') return 4;
    return int.parse(selectedPersonCount.replaceAll('명', '')) ??
        defaultData.person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '검색하기',
          style: h4(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: gap_m, right: gap_m),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value; // 입력된 값 저장
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
                    _startSearch(); // 검색 시작
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
                      _selectedRegion = value ?? '';
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
                        } else if (value == '20만원 이하') {
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
          // 결과 목록을 표시하는 Expanded 위젯 추가
          Expanded(
            child: SearchResultList(reqDTO: searchResultList),
          ),
        ],
      ),
    );
  }
}
