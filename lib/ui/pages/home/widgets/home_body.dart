import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
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
              Text(title, style: TextStyle(fontSize: 20)),
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
                      builder: (context) => StayDetailPage(stays: stays[index], rooms: rooms,),
                    ),
                  );
                },
                child: Container(
                  width: 190,
                  margin: EdgeInsets.symmetric(horizontal: gap_m),
                  child: Column(
                    children: [
                      // Wrap the Container with GestureDetector for onTap functionality
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StayDetailPage(stays: stays[index], rooms: rooms,),
                            ),
                          );
                        },
                        child: Container(
                          width: 190,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(gap_s),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${stays[index].stayImgTitle}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: gap_m),
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(gap_s),
                          color: Colors.white,
                        ),
                        child: Text(
                          stays[index].stayName,
                          maxLines: 1,
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
