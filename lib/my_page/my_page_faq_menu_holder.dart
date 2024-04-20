import 'package:flutter/material.dart';
import 'package:yogi_project/my_page/data/my_page_menu_icon.dart';

class MyPageFaqMenuHolder extends StatelessWidget {
  const MyPageFaqMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: myPageMenu.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(myPageMenu[index].iconData),
          title: Text(myPageMenu[index].title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        );
      },
    );
  }
}
