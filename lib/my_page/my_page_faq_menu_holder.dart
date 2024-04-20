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
          trailing: (index == 1 || index == 2) ? Row(
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
          ) : Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        );
      },
    );
  }
}