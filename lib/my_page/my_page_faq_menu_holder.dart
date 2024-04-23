import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 고객센터 메뉴 유형 enum
enum MenuType {
  FAQ,
  KakaoInquiry,
  CallCustomerService,
}

// 고객센터 메뉴
class MyPageMenu {
  final String title;
  final IconData iconData;
  final MenuType menuType; // 메뉴 유형 추가

  MyPageMenu({required this.title, required this.iconData, required this.menuType});
}

final List<MyPageMenu> myPageMenu = [
  MyPageMenu(title: '자주 묻는 질문', iconData: FontAwesomeIcons.info, menuType: MenuType.FAQ),
  MyPageMenu(title: '1:1 카카오 문의', iconData: FontAwesomeIcons.comment, menuType: MenuType.KakaoInquiry),
  MyPageMenu(title: '고객 행복센터 연결', iconData: FontAwesomeIcons.phone, menuType: MenuType.CallCustomerService),
];

// 마이페이지 고객센터 화면
class MyPageFaqMenuHolder extends StatelessWidget {
  const MyPageFaqMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: myPageMenu.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ListTile(
            title: Text('고객센터', style: TextStyle(fontWeight: FontWeight.bold)),
          );
        } else {
          final menuItem = myPageMenu[index - 1];
          return ListTile(
            leading: Icon(menuItem.iconData),
            title: Text(menuItem.title),
            onTap: () {
              _handleMenuAction(context, menuItem.menuType); // 메뉴 유형에 따른 액션 처리
            },
          );
        }
      },
    );
  }

  // 메뉴 유형에 따른 액션 처리 함수
  void _handleMenuAction(BuildContext context, MenuType menuType) {
    switch (menuType) {
      case MenuType.FAQ:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FAQPage()),
        );
        break;
      case MenuType.KakaoInquiry:
      // 카카오 문의 액션 추가
        break;
      case MenuType.CallCustomerService:
      // 고객 행복센터 전화 액션 추가
        _makePhoneCall('전화번호');
        break;
    }
  }

  // 전화 거는 함수
  void _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '전화 걸기에 실패했습니다: $url';
    }
  }
}

// 자주 묻는 질문 버튼
class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자주 묻는 질문'),
      ),
      body: Center(
        child: Text('자주 묻는 질문'),
      ),
    );
  }
}
