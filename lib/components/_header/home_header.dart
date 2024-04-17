import 'package:flutter/cupertino.dart';
import 'package:yogi_project/components/_header/home_header_logo.dart';

import '../../size.dart';
import 'home_header_appbar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            HomeHeaderLogo(),
            HomeHeaderAppBar(),
          ],
        ),
    );
  }
}