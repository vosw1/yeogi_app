import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 리뷰'),
      ),
      body: Center(
        child: Text('여기에 내 리뷰가 표시됩니다.'),
      ),
    );
  }
}