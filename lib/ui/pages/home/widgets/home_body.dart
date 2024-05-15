import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';

class HomeBody extends StatelessWidget {
  final String title;
  final List<Stay> stays;

  const HomeBody({
    Key? key,
    required this.title,
    required this.stays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: gap_s),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: gap_m),
              Text(title, style: h4()),
            ],
          ),
        ),
        SizedBox(height: gap_s),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              stays.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StayDetailPage(stayId: stays[index].id),
                    ),
                  );
                },
                child: Container(
                  width: 220,
                  margin: EdgeInsets.only(left: gap_m),
                  child: Column(
                    children: [
                      // Wrap the Container with GestureDetector for onTap functionality
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StayDetailPage(stayId: index),
                            ),
                          );
                        },
                        child: Container(
                          width: 220,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(gap_s),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/${stays[index].imagePath}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: gap_s),
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(gap_s),
                          color: Colors.white,
                        ),
                        child: Text(
                          stays[index].name,
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: gap_m),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
