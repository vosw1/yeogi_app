import 'package:flutter/material.dart';
import 'package:yogi_project/size.dart';

import '../components/_header/home_header.dart';
import '../components/body/home_body.dart';
import '../components/body/home_bottom_navigationbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildAppBarLogo(),
          HomeHeader(),
          HomeBody(),
          HomeBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildAppBarLogo() {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.all(gap_xm)),
        Image.asset("assets/images/logo.png",
            width: 200,
            height: 100),
        SizedBox(width: gap_l),
        Icon(
          Icons.notifications,
          color: Colors.grey,
        ),
      ],
    );
  }
}