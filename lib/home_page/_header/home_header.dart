import 'package:flutter/cupertino.dart';
import 'home_header_appbar.dart';
import 'home_header_logo.dart';

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