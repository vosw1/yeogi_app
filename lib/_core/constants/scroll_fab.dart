import 'package:flutter/material.dart';

class ScrollFAB extends StatelessWidget {
  final ScrollController controller;
  const ScrollFAB({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'up_button',
          onPressed: () {
            controller.animateTo(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          mini: true,
          backgroundColor: Colors.white,
          child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
        ),
        SizedBox(height: 1),  // 버튼 사이의 간격
        FloatingActionButton(
          heroTag: 'down_button',
          onPressed: () {
            controller.animateTo(
              controller.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          mini: true,
          backgroundColor: Colors.white,
          child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ),
      ],
    );
  }
}
