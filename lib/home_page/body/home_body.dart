import 'package:flutter/material.dart';
import 'package:yogi_project/home_page/body/set_banner_data.dart';
import '../../../size.dart';
import '../../../style.dart';
import '../../components/common/set_item_data.dart';
import 'home_body_banner.dart';
import 'home_item.dart';
import 'home_popular_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    List<ItemData> saleItemsData = [
      ItemData(
        imagePath: "assets/images/p1.png",
        starCount: 5,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        imgTitle: "p1",
        userName: "낭만여행가",
        location: "제주도",
      ),
      ItemData(
        imagePath: "assets/images/p1.png",
        starCount: 5,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        imgTitle: "p2",
        userName: "낭만여행가",
        location: "제주도",
      ),
    ];

    List<ItemData> popularItemsData = [
      ItemData(
        imagePath: "assets/images/p10.png",
        starCount: 4.5,
        comment: "경주ㅜㅠ너무 좋아요 산인데 벌레도 없고 친절하시고 너무 좋네요",
        imgTitle: "avarta",
        userName: "메타트립",
        location: "경주",
      ),
      ItemData(
        imagePath: "assets/images/p10.png",
        starCount: 5,
        comment: "경주ㅜㅠ너무 좋아요 산인데 벌레도 없고 친절하시고 너무 좋네요",
        imgTitle: "avarta",
        userName: "메타트립",
        location: "경주",
      ),
    ];

    return Align(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: gap_m),
            SizedBox(
              height: 240, // 배너의 높이 조정
              child: PageView(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 클릭 시 이동할 URL
                      String url = "https://example.com";
                      // URL로 이동
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
                    },
                    child: HomeBodyBanner(
                      BannerData(
                        "assets/images/body_banner.jpg", // 이미지 경로
                        "body_banner", // 이미지 제목
                        "여어떻노?", // 배너 제목
                        "국내 인기있는 숙소 여 다있네~\n퍼뜩 예약하꾸마!", // 배너 설명
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 클릭 시 이동할 URL
                      String url = "https://example.com";
                      // URL로 이동
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
                    },
                    child: HomeBodyBanner(
                      BannerData(
                        "assets/images/body_banner.jpg", // 이미지 경로
                        "body_banner", // 이미지 제목
                        "여어떻노?", // 배너 제목
                        "국내 인기있는 숙소 여 다있네~\n퍼뜩 예약하꾸마!", // 배너 설명
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: gap_m),
                  Text("특가 숙소 추천", style: h5()),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in saleItemsData)
                    HomeItem(itemData: itemData),
                ],
              ),
            ),
            SizedBox(height: gap_xs),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: gap_m),
                  Text("인기 숙소 추천", style: h5()),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in popularItemsData)
                    HomePopularItem(popularItemsData: itemData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
