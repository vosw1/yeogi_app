import 'package:flutter/material.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/ui/pages/stay/stay_detail_page.dart';
import '../../../../_core/constants/size.dart';
import '../../../../data/models/stay.dart';

class HomeBody extends StatelessWidget {
  final String title;
  final List<Stay> stayData;

  const HomeBody({
    Key? key,
    required this.title,
    required this.stayData,
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
              stayData.length,
                  (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StayDetailPage(stayData: stayData[index], roomData: roomData,),
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
                              builder: (context) => StayDetailPage(stayData: stayData[index], roomData: roomData),
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
                                  'assets/images/${stayData[index].stayImgTitle}'),
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
                          stayData[index].stayName,
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
