import 'package:flutter/material.dart';
import 'package:daum_postcode_search/data_model.dart';
import 'daum_post_code_search_widget.dart';

class LibraryDaumPostcodePage extends StatelessWidget {
  final Function(DataModel)? onAddressSelected;

  const LibraryDaumPostcodePage({Key? key, this.onAddressSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소 검색'),
      ),
      body: DaumPostcodeSearchWidget(
        onAddressSelected: (controller, data) {
          if (onAddressSelected != null) {
            onAddressSelected!(data); // 선택된 주소 정보 전달
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('에러'),
                content: Text('주소 정보를 반환할 콜백이 설정되지 않았습니다.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('확인'),
                  ),
                ],
              ),
            );
          }
          Navigator.of(context).pop(); // 이전 화면으로 돌아가기
        },
      ),
    );
  }
}
