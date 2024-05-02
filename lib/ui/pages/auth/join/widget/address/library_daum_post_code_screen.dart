import 'package:flutter/material.dart';
import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LibraryDaumPostcodeScreen extends StatelessWidget {
  final Function(DataModel)? onAddressSelected; // 수정된 부분: 선택된 주소 정보를 전달하기 위한 함수 추가

  const LibraryDaumPostcodeScreen({Key? key, this.onAddressSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다음 주소 검색'),
      ),
      body: DaumPostcodeSearchWidget(
        onAddressSelected: (controller, data) {
          // 선택된 주소 정보를 이전 화면으로 반환
          Navigator.of(context).pop();
          if (onAddressSelected != null) {
            onAddressSelected!(data); // 선택된 주소 정보 전달
          }
        },
      ),
    );
  }
}

class DaumPostcodeSearchWidget extends StatelessWidget {
  final Function(InAppWebViewController controller, dynamic data)? onAddressSelected;

  const DaumPostcodeSearchWidget({Key? key, this.onAddressSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DaumPostcodeSearch(
      initialOption: InAppWebViewGroupOptions(),
      onConsoleMessage: (controller, consoleMessage) {
        // 필요에 따라 콘솔 메시지 처리
      },
      onLoadError: (controller, url, code, message) {
        // 필요에 따라 로드 오류 처리
      },
      onLoadHttpError: (controller, url, statusCode, description) {
        // 필요에 따라 HTTP 로드 오류 처리
      },
      onProgressChanged: (controller, progress) {
        // 필요에 따라 진행 상황 변경 처리
      },
      androidOnPermissionRequest: (controller, origin, resources) async {
        // 필요에 따라 권한 요청 처리
        return PermissionRequestResponse(
          resources: resources,
          action: PermissionRequestResponseAction.GRANT,
        );
      },
    );
  }
}
