import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';

class RoomNotice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: gap_xm,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_xs),
      ),
      padding: EdgeInsets.symmetric(horizontal: gap_xx),
      child: Center(
        child: Text(
          "당일 취소 불가능",
          style: h5(mColor: Colors.redAccent),
        ),
      ),
    );
  }
}