import 'package:flutter/material.dart';
import 'package:yogi_project/my_page/data/my_page_menu_icon.dart';

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
            onTap: () {},
          );
        } else {
          return ListTile(
            leading: Icon(myPageMenu[index - 1].iconData), // 인덱스 조정
            title: Text(myPageMenu[index - 1].title),
            trailing: (index == 2 || index == 3)
                ? Row(
                    // 인덱스 조정으로 1:1 카카오 문의와 고객 행복센터 연결에만 특별한 트레일링 추가
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '오전 9시 ~ 새벽 3시',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  )
                : Icon(Icons.arrow_forward_ios),
            onTap: () {},
          );
        }
      },
    );
  }
}
