import 'package:flutter/material.dart';
import '../../../../_core/constants/move.dart';
import '../../../../data/models/stay.dart';
import '../../../../data/models/user.dart';
import '../../stay/stay_page.dart';
import 'home_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 특가 숙소 리스트
    List<Stay> saleItemsList = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      ),
    ];
    // 국내 숙소 리스트
    List<Stay> dometicesStayItemList = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      ),
    ];
    // 해외 숙소 리스트
    List<Stay> overseasStayItemList = [
      Stay(
        stayImgTitle: "p1.png",
        stayName: "제주의 아침",
        stayInfo: "ㅇ",
        location: "제주도",
        notice: "여기요는..",
        starCount: 4,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
      ),
    ];

    List<User> userDataList = [
      User(
       userImgTitle: "p1.png",
        userName: "메타코딩",
        email: 'ssar@nate.com',
      ),
    ];

    return Align(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("특가 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 특가 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in saleItemsList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: itemData),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("국내 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 국내 숙소 리스트 페이지
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in dometicesStayItemList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: itemData),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("해외 숙소", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            // 해외 숙소 리스트 페이지뷰
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in overseasStayItemList)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StayPage(stayData: itemData),
                          ),
                        );
                      },
                      child: HomeItem(userData: userDataList[0], stayData: itemData),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
