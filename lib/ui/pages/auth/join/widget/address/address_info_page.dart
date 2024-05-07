import 'package:flutter/material.dart';
import 'package:daum_postcode_search/data_model.dart';
import 'library_daum_post_code_page.dart';

class AddressInfoPage extends StatefulWidget {
  @override
  _AddressInfoPageState createState() => _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {
  DataModel? _dataModel;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
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
            // 주소 검색 위젯과 회원가입 주소 입력 폼 필드 등의 UI 구성 요소들
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: '도로명 주소',
                hintText: '도로명 주소를 입력하세요',
              ),
            ),
            ElevatedButton(
              onPressed: _showDaumAddressSearch,
              child: Text('주소 검색'),
            ),
            ElevatedButton(
              onPressed: _saveAddressInfo,
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDaumAddressSearch() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LibraryDaumPostcodePage(
          onAddressSelected: (data) {
            setState(() {
              _dataModel = data;
              _addressController.text = _dataModel!.roadAddress ?? '';
            });
          },
        ),
      ),
    );
  }

  void _saveAddressInfo() {
    // 주소 정보 저장 등의 작업 수행
  }
}
