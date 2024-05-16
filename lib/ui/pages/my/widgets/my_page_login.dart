import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/data/models/reply.dart';
import 'package:yogi_project/data/models/review.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/models/user.dart';
import 'package:yogi_project/ui/pages/my/my_page.dart';

class MyPageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final User userData = User(
              name: '홍길동',
              id: 1,
              email: '',
              password: '',
              createdAt: null,
              updatedAt: null, 
              userImgTitle: '',
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPage(users: users,)),
            );
          },
          child: Text('Go to My Page'),
        ),
      ),
    );
  }
}
