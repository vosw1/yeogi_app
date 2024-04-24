import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제 페이지'),
      ),
      body: Center(
        child: Text(
          '결제 페이지',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}