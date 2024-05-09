import 'package:flutter/material.dart';
import '../../../../../data/models/stay.dart';

class SaleStayPage extends StatelessWidget {
  final Stay stayData;

  SaleStayPage({required this.stayData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('특가숙소'),
      ),
      body: Center(
        child: Text('이 페이지에서 특가 숙소 정보를 표시합니다.'),
      ),
    );
  }
}
