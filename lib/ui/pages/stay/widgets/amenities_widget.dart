import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/size.dart';

class AmenitiesWidget extends StatelessWidget {
  final List<Map<IconData, String>> amenities;

  const AmenitiesWidget({Key? key, required this.amenities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: amenities.map((amenity) {
        return _buildAmenityIcon(amenity.keys.first, amenity.values.first);
      }).toList(),
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
