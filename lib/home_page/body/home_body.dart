import 'package:flutter/material.dart';
import 'package:yogi_project/home_page/body/home_abroard_item.dart';
import 'package:yogi_project/components/data/set_banner_data.dart';
import '../../../size.dart';
import '../../../style.dart';
import '../../components/data/home_item_data.dart';
import 'home_body_banner.dart';
import 'home_item.dart';
import 'home_popular_item.dart';

// 홈페이지 바디 부분 - 특가숙소, 인기숙소, 해외숙소
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    // 특가 숙소 리스트
    List<ItemData> saleItemsData = [
      ItemData(
        stayImgTitle: "p1.png",
        starCount: 5,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        userImgTitle: "p2.png",
        userName: "낭만여행가",
        location: "제주도",
      ),
      ItemData(
        stayImgTitle: "p1.png",
        starCount: 5,
        comment: "역시 제주도~ 귤 나무들도 너무 예뻤고 산책로도 있어서 너무 좋았어요!!",
        userImgTitle: "p2.png",
        userName: "낭만여행가",
        location: "제주도",
      ),
    ];
    // 인기 숙소 리스트
    List<ItemData> popularItemsData = [
      ItemData(
        stayImgTitle: "p10.png",
        starCount: 4.5,
        comment: "경주ㅜㅠ너무 좋아요 산인데 벌레도 없고 친절하시고 너무 좋네요",
        userImgTitle: "avarta.png",
        userName: "메타트립",
        location: "경주",
      ),
      ItemData(
        stayImgTitle: "p10.png",
        starCount: 5,
        comment: "경주ㅜㅠ너무 좋아요 산인데 벌레도 없고 친절하시고 너무 좋네요",
        userImgTitle: "avarta.png",
        userName: "메타트립",
        location: "경주",
      ),
    ];
    // 해외 숙소 리스트
    List<ItemData> homeAbroadItemData = [
      ItemData(
        stayImgTitle: "LosAngeles.png",
        starCount: 5,
        comment: "할리우드 처음가봤는데 진짜 안가봤으면 후회해요! 다들 꼭 가보세요",
        userImgTitle: "avarta.png",
        userName: "메타트립",
        location: "미국 LosAngeles",
      ),
      ItemData(
        stayImgTitle: "Guam.png",
        starCount: 5,
        comment: "괌..역시 신혼여행의 성지...너무 좋아요ㅜㅠ",
        userImgTitle: "avarta.png",
        userName: "해외여행중독",
        location: "괌 Guam",
      ),
    ];

    return Align(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: gap_m),
            SizedBox( // 배너 페이지 뷰
              height: 240, // 배너의 높이 조정
              child: PageView(
                children: [
                  GestureDetector(
                    onTap: () {// 클릭 시 이동할 URL
                      String url = "https://example.com";
                      // URL로 이동
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
                    },
                    // 배너 기본 틀
                    child: HomeBodyBanner(
                      BannerData(
                        "body_banner.jpg", // 이미지 경로
                        "body_banner", // 이미지 제목
                        "여어떻노?", // 배너 제목
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
                    // 배너 기본틀
                    child: HomeBodyBanner(
                      BannerData(
                        "assets/images/body_banner.jpg", // 이미지 경로
                        "body_banner", // 이미지 제목
                        "여어떻노?", // 배너 제목
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(// 특가 숙소 추천 타이틀
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: gap_m),
                  Text("특가 숙소 추천", style: h5()),
                ],
              ),
            ),
            SizedBox(// 특가 숙소 리스트 페이지뷰
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in saleItemsData)
                    HomeItem(itemData: itemData),
                ],
              ),
            ),
            SizedBox(height: gap_xs),
            SizedBox( // 인기 숙소 추천 타이틀
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: gap_m),
                  Text("인기 숙소 추천", style: h5()),
                ],
              ),
            ),
            SizedBox( // 인기 숙소 리스트 페이지뷰
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in popularItemsData)
                    HomePopularItem(popularItemsData: itemData),
                ],
              ),
            ),
            SizedBox(height: gap_xs),
            SizedBox( // 인기 해외 추천 타이틀
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: gap_m),
                  Text("인기 해외 추천", style: h5()),
                ],
              ),
            ),
            SizedBox( // 인기 해외 추천 페이지뷰
              height: 400,
              child: PageView(
                children: [
                  for (var itemData in homeAbroadItemData)
                    HomeAbroadItem(homeAbroadItemData: itemData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
