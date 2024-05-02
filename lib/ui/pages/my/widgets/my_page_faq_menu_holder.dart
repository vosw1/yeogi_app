import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yogi_project/_core/constants/size.dart';

// 고객센터 메뉴 유형 enum
enum MenuType {
  FAQ,
  CallCustomerService,
}

// 고객센터 메뉴
class MyPageMenu {
  final String title;
  final IconData iconData;
  final MenuType menuType; // 메뉴 유형 추가

  MyPageMenu({
    required this.title,
    required this.iconData,
    required this.menuType,
  });
}

final List<MyPageMenu> myPageMenu = [
  MyPageMenu(
    title: '자주 묻는 질문',
    iconData: FontAwesomeIcons.info,
    menuType: MenuType.FAQ,
  ),
  MyPageMenu(
    title: '고객 행복센터 연결',
    iconData: FontAwesomeIcons.phone,
    menuType: MenuType.CallCustomerService,
  ),
];

// 마이페이지 고객센터 화면
class MyPageFaqMenuHolder extends StatelessWidget {
  const MyPageFaqMenuHolder({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: myPageMenu.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ListTile(
            title: Text(
              '고객센터',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else {
          final menuItem = myPageMenu[index - 1];
          return ListTile(
            leading: Icon(menuItem.iconData),
            title: Text(menuItem.title),
            trailing: (index == 2 || index == 3)
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '오전 9시 ~ 오전 6시',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            )
                : Icon(Icons.arrow_forward_ios),
            onTap: () {
              _handleMenuAction(context, menuItem.menuType);
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

      case MenuType.CallCustomerService:
      // 고객 행복센터 전화 액션 추가
        _makePhoneCall('010-2960-7454'); // 실제 전화번호 입력
        break;
    }
  }

  // 전화 거는 함수
  void _makePhoneCall(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (res == null || !res) {
      throw '전화 걸기에 실패했습니다: $phoneNumber';
    }
  }

}

// 자주 묻는 질문 페이지
class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자주 묻는 질문'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: gap_l), // 원하는 만큼의 상하 여백을 주세요
        child: FAQList(), // 자주 묻는 질문 리스트를 표시하는 위젯을 불러옵니다.
      ), // 자주 묻는 질문 리스트를 표시하는 위젯을 불러옵니다.
    );
  }
}

// 자주 묻는 질문 리스트를 표시하는 위젯입니다.
class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqItemsData.length, // FAQ 아이템 개수만큼 리스트 생성
      itemBuilder: (context, index) {
        return FAQTile(faqItem: faqItemsData[index]);
      },
    );
  }
}

class FAQTile extends StatefulWidget {
  final FAQItem faqItem;

  FAQTile({required this.faqItem});

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.faqItem.question),
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Text(
            widget.faqItem.answer,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
      initiallyExpanded: _isExpanded,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
    );
  }
}


// 자주 묻는 질문 아이템 모델
class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

// 자주 묻는 질문 리스트
List<FAQItem> faqItemsData = [
  FAQItem(
    question: '[이용문의] 고객센터 연결 지연 시 어떻게 하나요?',
    answer:
    '▶ 일부 시간대에는 통화량이 많아 상담사 연결이 지연될 수 있습니다.\n\n▶ 간단한 질문의 경우 자주 묻는 질문을 이용해주세요.',
  ),
  FAQItem(
    question: '[숙박] 예약을 확인하고 싶어요.',
    answer:
    '▶ 예약은 앱 하단 내정보 > 예약/구매내역에서 확인 가능합니다.\n\n▶ 숙소의 확인 후 예약 확인이 확정이 납니다.',
  ),
  FAQItem(
    question: '[숙박] 예약을 취소하고 싶어요.',
    answer:
    '▶ 예약취소는  앱/웹 > 내정보 > 예약/구매내역에서 직접 가능합니다.\n\n▶ 예약/결제 진행 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불 처리됩니다.\n\n▶ 일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서 취소가 불가할 수 있으니 이 경우에는 고객행복센터로 요청해 주시길 바랍니다.',
  ),
  FAQItem(
    question: '[숙박] 체크인날짜/객실타입을 변경하고 싶어요.',
    answer:
    '▶ 예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다.\n\n▶ 예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용 부탁드립니다.\n\n※ 만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 고객행복센터로 문의해주시길 바랍니다.',
  ),
  FAQItem(
    question: '[공통] 천재지변/감염병으로 인한 예약취소는 어떻게 하나요?',
    answer:
    '▶ 천재지변(기상악화), 법정 감염병 등 불가항력적인 사유로 제휴점 이용이 불가할 경우 고객행복센터로 예약내역 및 증빙서류(결항확인서, e-티켓, 진단확인서 등)를 보내주시면 확인 후 예약취소 가능 여부를 확인해 드립니다.\n\n※ 다만, 당사는 판매 중개 플랫폼의 입장으로 제휴점에 대하여 취소/환불을 강제할 수 없어 각 제휴점의 규정에 근거하여 상황에 따라 수수료가 발생하거나 취소가 어려울 수 있는 점 양해 부탁드립니다.\n[접수방법]\n- 이메일 : help@goodchoice.kr (예약자명, 예약번호, 숙소명, 체크인 날짜 필수)\n- 카카오톡 : 카카오톡 내 플러스 친구 > 여기어때 고객행복센터 추가',
  ),
  FAQItem(
    question: '[리뷰]리뷰는 어떻게 등록할 수 있나요?',
    answer:
    '▶ 실제 숙소를 이용한 회원만 리뷰를 작성할 수 있습니다.\n\n일반 회원: 체크인 시간 ~ 체크아웃 30일 이내\n트립홀릭: 체크인 시간 ~ 체크아웃 180일 이내\n\n[등록방법\n- 앱 하단 내정보 > 숙소 예약내역 > 이용전/이용후 > 예약상세 > 리뷰 작성 ',
  ),
  FAQItem(
    question: '[리뷰] 등록한 리뷰를 수정/삭제 하고 싶어요.',
    answer:
    '▶ 등록한 리뷰는 앱 하단 내정보 > 나의 리뷰에서 직접 수정/삭제가 가능합니다.\n\n※ 단, 리뷰 수정은 작성 후 48시간 이전까지만 가능하며 리뷰 삭제 시 지급된 포인트는 차감되는 점 참고 부탁드립니다.',
  ),
  FAQItem(
    question: '숙소에서 예약취소 했어요. 어떻게 하나요?',
    answer:
    '▶ 여기어때는 숙소 사정으로 예약하신 상품이 취소된 경우 대안 숙소를 찾아드리는 안심예약제를 운영하고 있습니다. \n\n▶ 단순 환불 처리에 그치지 않고 더 좋은 숙소에서 이용하실 수 있도록 도움드리고 있사오니 아래 적용/제외 기준을 참고하여 고객행복센터로 문의해 주시길 바랍니다.\n\n[적용기준]\n- 여기어때 예약 서비스를 이용한 예약 건\n- 숙소의 귀책으로 발생되는 취소 건\n- 국내 숙소 중 모든 숙박 카테고리 동일 적용 (액티비티 제외, 안심예약 가능 업체만 적용)\n[제외기준]\n- 고객의 귀책(변심 등)으로 인한 취소 건\n- 타 사이트, 타 플랫폼을 통한 예약 건\n- 예약대기 상태의 취소 건\n- 부대시설 이용 불가 건 ',
  ),
  FAQItem(
    question: '[회원정보] 여러 개의 아이디를 만들 수 있나요?',
    answer:
    '▶ 한 명이 여러개의 아이디를 만드는 것이 가능합니다.\n\n※ 단 개별 아이디에서 진행 중인 이벤트는 해당 아이디 에서만 가능합니다.',
  ),
];
