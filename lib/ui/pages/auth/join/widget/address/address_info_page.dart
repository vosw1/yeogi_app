import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/address/library_daum_post_code_screen.dart';
import 'package:yogi_project/ui/pages/auth/join/widget/join_text_form_field.dart'; // 수정된 부분: JoinTextFormField 임포트 추가

class AddressInfoPage extends StatefulWidget {
  @override
  _AddressInfoPageState createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  DataModel? _dataModel;
  late TextEditingController _addressController; // 수정된 부분: 주소를 입력할 수 있는 컨트롤러 추가

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(); // 수정된 부분: 컨트롤러 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소 정보'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            JoinTextFormField( // 수정된 부분: 주소 입력 필드 추가
              controller: _addressController,
              labelText: '주소',
              hintText: '주소를 입력하세요',
              onAddressSearch: () {
                _showDaumAddressSearch(); // 주소 검색 다이얼로그 표시
              },
            ),
            SizedBox(height: 20),
            if (_dataModel != null) ...[
              _text("도로명 주소", _dataModel!.roadAddress),
              _text("지번 주소", _dataModel!.jibunAddress),
              // 필요한 필드를 추가하세요
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 주소 정보 저장 등의 작업 수행
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(195, 195, 195, 1),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDaumAddressSearch() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LibraryDaumPostcodeScreen(
          onAddressSelected: (data) {
            setState(() {
              _dataModel = data; // 선택된 주소 정보 설정
              // 선택된 주소를 주소 입력 필드에 설정
              _addressController.text = _dataModel!.roadAddress ?? '';
            });
          },
        ),
      ),
    );
  }
}
