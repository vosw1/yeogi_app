import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';


// 편의 시설 섹션 위젯
class AmenitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '편의 시설',
          style: h6(),
        ),
        SizedBox(height: gap_m),
        Row(
          children: [
            _buildAmenityIcon(Icons.fitness_center, '피트니스'),
            _buildAmenityIcon(Icons.spa, '사우나'),
            _buildAmenityIcon(Icons.wifi, '와이파이'),
            _buildAmenityIcon(Icons.smoke_free, '금연'),
            _buildAmenityIcon(Icons.ac_unit, '에어컨'),
            _buildAmenityIcon(Icons.kitchen, '냉장고'),
          ],
        ),
        SizedBox(height: gap_s),
        Divider(),
        SizedBox(height: gap_s),
      ],
    );
  }

  Widget _buildAmenityIcon(IconData iconData, String text) {
    return Padding(
      padding: EdgeInsets.only(right: gap_s),
      child: Column(
        children: [
          Icon(iconData),
          SizedBox(height: gap_xs),
          Text(text),
        ],
      ),
    );
  }
}
