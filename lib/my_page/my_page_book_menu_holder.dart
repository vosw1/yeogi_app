import 'package:flutter/material.dart';

class MyPageBookMenuHolder extends StatelessWidget {
  const MyPageBookMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('예약내역', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {

          },
        ),
        ListTile(
          title: Text('국내숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
        ListTile(
          title: Text('해외숙소'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
      ],
    );
  }
}
