import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AddressSearchPage extends StatefulWidget {
  @override
  _AddressSearchPageState createState() => _AddressSearchPageState();
}

class _AddressSearchPageState extends State<AddressSearchPage> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소 검색'),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://postcode.map.daum.net/guide'),
          ),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onLoadStop: (controller, url) async {
            if (url.toString().contains('주소검색 완료 페이지 URL')) {
              // 주소 검색 완료 페이지 URL에 대한 조건을 지정
              var selectedAddress = await _webViewController.evaluateJavascript(source: '''
                // JavaScript 코드: 주소 정보를 가져오는 스크립트
                // 예시: var address = '서울특별시 강남구 삼성동';
                // 주소 정보를 JSON 형태로 반환
                JSON.stringify({ 
                  address: address
                });
              ''');

              // JSON 문자열을 Map으로 파싱
              Map<String, dynamic> addressMap = jsonDecode(selectedAddress);
              String address = addressMap['address'];

              // 주소 정보를 이용하여 추가적인 작업 수행
              // 예시: 주소를 사용하여 필요한 작업 수행
            }
          },
        ),
      ),
    );
  }
}
