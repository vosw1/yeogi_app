import 'package:flutter/cupertino.dart';

import '../../size.dart';
import 'home_header_appbar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: HomeHeaderAppBar(),
    );
  }
}