import 'package:daum_postcode_search/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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