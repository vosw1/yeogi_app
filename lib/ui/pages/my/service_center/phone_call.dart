import 'package:url_launcher/url_launcher.dart';

class PhoneCall {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '전화 걸기에 실패했습니다: $url';
    }
  }
}
