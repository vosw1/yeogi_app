import 'package:flutter/material.dart';

import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../../../../data/models/stay.dart';
import '../stay_page.dart';

class ModelStayPage extends StatelessWidget {
  const ModelStayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 캠핑 숙소 리스트
    List<Stay> motelDataList = [
      Stay(
        stayImgTitle: "motel/motel1.png",
        stayName: "종로 부티크 호텔K",
        stayInfo: "안녕하세요 K클래식&부티크호텔k입니다 . 2022년 08월01일부터 K클래식호텔과 부티크k호텔을 통합 운영합니다. 따라서 객실 예약시  사전 확인 부탁드립니다  *(입실 후  운영상 변경이 불가하시는점 참고 부탁드립니다) 또한  보여지는 객실과  다른 구조의 객실로 배정 받으실 수 있는 점 참고하여 예약 해주시길 바랍니다 .",
        location: "서울 종로구 관철동 21",
        notice: "객실 내부 시설\n객실 배정은 손님 오시는 순서대로 랜덤 배정입니다\n특히 K클래식 준특실의 경우 욕조가 없는 객실을 배정 받을 수 있습니다.\n전객실 넷플릭스&유튜브 이용가능합니다넷플릭스 개인 계정 사용 필수)",
        starCount: 4.5,
        comment: "종로 인근에서 조용히, 편하게 1박하면서 작업하러 이용했습니다. 부띠끄 호텔 타이틀을 한만큼 그 티를 내려고 애쓴 흔적이 보입니다.",
      ),
      Stay(
        stayImgTitle: "motel/motel2.png",
        stayName: "종로 K-World-종로 3가",
        stayInfo: "",
        location: "서울 종로구 관수동 104-2",
        notice: "객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요.",
        starCount: 5,
        comment: "케이월드호텔은 종로3가 국일관뒷편으로교통이 편리합니다. 지하철역도보로5분거리에 위치해있고 주변에 유명맛집들도 많아서 식도락여행에 별미를 즐길수있습니다.",
      ),
      Stay(
        stayImgTitle: "motel/motel3.png",
        stayName: "영등포 H-AVENUE",
        stayInfo: "⭐2023.06.30 GRAND OPEN⭐\n모든것이 신규 신상인 신축 건물입니다.\n신규 신상 신축이 영원하도록 철저한 객실 관리와 꼼꼼한 소독 및 방역\n고객님이 떠나실때마다 소독과 점검을꼬박꼬박 실시하고 있습니다.\n고객님께 룸제공시 청결도 확인으로 인하여 입실시간이 늦어질수 있는점\n양해 부탁드립니다^^(최대5분~10분)",
        location: "서울 영등포구 영등포동3가 23",
        notice: "객실 내부 시설\nH-AVENU HOTEL 고객님 편의사항\n숙박업소 최초 전객실 천정형 공기순환기 설치\n전객실 1GB 광랜설치\n전객실 Wi-Fi\n전객실 시스템 냉,난방\n전객실 넷플릭스 무료 이용가능\n전객실 LG스마트 TV\n전객실 스마트 비데설치\n전객실 헝가리구스 침구\n호텔내 얼음제빙기,커피머신기,렌즈통,렌즈액,전자렌지,ATM현금지급기 설치.능",
        starCount: 5,
        comment: "@야외욕조(?) 라고 되어있지만 완전 야외는 아니고요. 천정유리로 되어있는 그래서 그런가 공기는 약간 야외 같기도 해요.그래도 진짜 야외였으면 추워서 이용 못했을것 같은 한겨울에도 왔었는데 그때보다 이번엔 날이 따뜻해서 덜 추웠네요.",
      ),
      Stay(
        stayImgTitle: "motel/motel4.png",
        stayName: "역삼 인트로호텔",
        stayInfo: "",
        location: "서울 강남구 역삼동 677-14",
        notice: "객실별 취소 정책이 상이하니 객실 상세정보에서 확인해주세요.",
        starCount: 5,
        comment: "리뷰가 워낙 좋아서 예약해봤는데 좋은만큼 진짜 깔끔하고 가 격대비 너무 좋은 것 같아요~ 담배 냄새 진짜 1도 안 나고 숙 소 엄청 깔끔합니다!! ",
      ),
      Stay(
        stayImgTitle: "motel/motel5.png",
        stayName: "강남 멜리샤호텔",
        stayInfo: "",
        location: "서울 강남구 역삼동 825-29",
        notice: "객실 내부 시설\n전객실 넷플릭스를 무료로 이용 가능합니다.\n전객실 욕조, 비데, 55인치 스마트TV, VOD , PC, 공기청정기 등의 시설을 갖추고 있습니다.\n최고급 구스다운 침구류와 새 린넨으로 편안한 잠자리를 경험해보세요.\n유럽 최고의 명품 브랜드 리날디 메모리폼 메트리스가 전객실 비치되어 있습니다.\n 객실내 와이파이 무료 이용 가능합니다.\n전객실 충전기가 비치되어 있습니다.\n전객실 드라이기및 고대기가 설치되어 있습니다.",
        starCount: 5,
        comment: "넷플릭스 볼수있는곳이라서 너무 좋아요~~~우선 가장 최고의 장점은 역에서 가깝다는거에요!!!! 강남역에서 도보 3분정도 거리에 위치해있어서 너무 좋습니다 접근성이 좋아요",
      ),
      Stay(
        stayImgTitle: "motel/motel6.png",
        stayName: "신촌 앨리 - ALLEY",
        stayInfo: "새로 오픈 기념 어메니티 4종(샴프, 린스, 바디, 로션) 무료 증정합니다.",
        location: "서울 서대문구 대현동 110-35",
        notice: "객실 내부 시설\n* 2020년 4월 15일 오픈한 신규 호텔입니다!!!\n* 당 호텔 정책상 2005년 생은 3월 부터 입실 가능 합니다",
        starCount: 5.0,
        comment: "전체적으로 너무 깔끔하고 좋았어요. 무엇보다 인포에 계신 직원분도 너무 친절하시고 다음에도 재방문 의사 충분히 있습니다. ",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('모텔'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ListView.builder(
          itemCount: motelDataList.length,
          itemBuilder: (context, index) {
            final Stay stay = motelDataList[index];
            return Padding(
              padding: const EdgeInsets.only(top: gap_m, left: gap_m, right: gap_m),
              child: Row(
                children: [
                  SizedBox(height: gap_xs),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StayPage(stayData: stay),
                          ),
                        );
                      },
                      child: Container(
                        height: 150, // 사진의 높이
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/${stay.stayImgTitle}"), // 이미지 경로
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // 사진과 텍스트 사이 간격
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity, // 화면 너비에 맞추기 위해 사용
                          child: Text(
                            stay.stayName,
                            style: h5(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.location, // 숙소 위치
                          style: subtitle1(),maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4), // 텍스트 사이 간격
                        Text(
                          stay.stayInfo, // 숙소 정보
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}