import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final void Function(double)? onChanged;

  StarRating({Key? key, required this.rating, this.onChanged}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () {
              if (widget.onChanged != null) {
                widget.onChanged!(i.toDouble());
              }
            },
            child: Icon(
              Icons.star,
              color: widget.rating >= i ? Colors.redAccent : Colors.grey,
            ),
          ),
        SizedBox(width: 8), // 간격 추가
        Text(
          '${widget.rating}.0 점', // 현재 별점을 표시
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
