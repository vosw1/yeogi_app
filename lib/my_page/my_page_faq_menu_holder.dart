import 'package:flutter/material.dart';
import 'package:yogi_project/my_page/data/my_page_menu_icon.dart';

class MyPageFaqMenuHolder extends StatelessWidget {
  const MyPageFaqMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: myPageMenu.length + 1, // 고객센터 항목을 포함하기 위해 +1
      itemBuilder: (BuildContext context, int index) {
        // 첫 번째 인덱스일 때 고객센터 ListTile 반환
        if (index == 0) {
          return ListTile(
            title: Text('고객센터', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              // 고객센터 탭 시 수행할 동작
            },
          );
        }
        // 그 외의 경우, myPageMenu 항목 반환 (인덱스 조정 필요)
        return ListTile(
          leading: Icon(myPageMenu[index - 1].iconData), // 인덱스를 1 감소시켜 조정
          title: Text(myPageMenu[index - 1].title), // 인덱스를 1 감소시켜 조정
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // 각 메뉴 탭 시 수행할 동작
          },
        );
      },
    );
  }
}
