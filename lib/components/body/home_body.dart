import 'package:flutter/cupertino.dart';
import '../../size.dart';
import 'home_body_popular_item.dart';
import 'home_sale_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);

    return Align(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 680,
                child: HomeBodyBanner()),
            SizedBox(height: gap_xm),
            HomeSaleItem(id: 1),
            HomeSaleItem(id: 2),
            HomeSaleItem(id: 3),
            HomeSaleItem(id: 4),
            HomeSaleItem(id: 5),
            HomeSaleItem(id: 6),
          ],
        ),
      ),
    );
  }
}