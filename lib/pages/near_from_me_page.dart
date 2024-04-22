import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:yogi_project/size.dart';

class NearFromMePage extends StatefulWidget {
  @override
  _NearFromMePageState createState() => _NearFromMePageState();
}

class _NearFromMePageState extends State<NearFromMePage> {
  String _searchText = '';
  List<String> searchResults = [];
  late Completer<NaverMapController> _controllerCompleter;

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<NaverMapController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: gap_l),
            TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: '주변 숙소를 찾아보세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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
            SizedBox(height: gap_xs),
            ElevatedButton.icon(
              onPressed: () {}, // 내 위치 찾기 기능 추가
              icon: Icon(Icons.location_on),
              label: Text('내 위치에서 찾아보기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // 배경색은 레드 악센트
                foregroundColor: Colors.white, // 아이콘과 글자는 흰색
              ),
            ),
            SizedBox(height: gap_xs),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(gap_s),
                child: NaverMap(
                  // Flutter Naver Map 위젯 추가
                  options: const NaverMapViewOptions(
                    indoorEnable: true, // 실내 맵 사용 가능 설정
                    locationButtonEnable: false, // 위치 버튼 표시 설정
                    consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 설정
                  ),
                  onMapReady: (controller) async {
                    // 지도가 준비되었을 때 호출되는 콜백 함수
                    // NaverMapController를 Completer에 완료합니다.
                    _controllerCompleter.complete(controller);
                    log("onMapReady", name: "onMapReady"); // 로그 출력
                  },
                ),
              ),
            ),
            SizedBox(height: gap_m),
            Text(
              '결과 ${searchResults.length}건',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(), // 라인 그어주는 Divider 추가
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
