import 'package:flutter/cupertino.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';


class HotelStayList extends StayListPage {
  const HotelStayList({Key? key}) : super(key: key, appBarTitle: '호텔');

  @override
  List<Stay> getStayDataList() {
    return [
      // 호텔 숙소 리스트
      Stay(
        stayImgTitle: "hotel/hotel1.png",
        stayName: "하이원리조트 마운틴콘도",
        stayInfo:
            "복층 구조의 넓고 여유로운 공간, 고급 대리석과 원목 마루로 마감한 격조높은 인테리어가 차원이 다른 편안함을 드립니다\n최고의 부대시설을 갖춘 마운틴 콘도에서 내 집처럼 편안한 휴식을 취해 보세요",
        location: "강원 정선군 고한읍 고한리 438",
        notice:
            "공지사항\n리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다\n객실 이미지는 대표 객실이며, 체크인 시 배정받는 동에 따라 객실 이미지와 상이할 수 있습니다",
        reviews: [
          {
            'starCount': 4,
            'comment':
                "스노우월드 가기위해서 객실 예약을 했는데 늦은시간 입실했지만 조용하고 24시간 편의점도 꽤 커서 잘 놀다가요! 객실도 따뜻하고 깨끗해서 너무 좋았고 화장실도 두개나 있어서 여유있게 사용했습니다 :) 스노우월드는 너무 너무 강추해요!!! 다음엔 스키타러 또 올게요~",
          },
          {
            'starCount': 3,
            'comment':
            "그저그럼... ",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          },{
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel2.png",
        stayName: "하이원 그랜드 호텔 컨벤션타워",
        stayInfo:
            "고객 편의를 위해 호텔 관련 모든 정보의 시스템 구축과 ONE STOP SERVICE 제공에 중점을 둔 호텔입니다\n고객의 니즈를 충족시키기 위해 다양한 유형의 객실을 갖추고 있습니다",
        location: "경기 가평군 북면 목동리 344-1",
        notice:
            "리조트 시설 확인 및 운영 여부, 운영시간, 할인 적용, 기타 문의 등 하이원리조트 대표번호(1588-7789) 문의 부탁드립니다",
        reviews: [
          {
            'starCount': 5,
            'comment': "삼척촛대바위를 여행하고 오늘 숙박할 하이원그랜드호텔로 향합니다 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel3.png",
        stayName: "하이원리조트 힐콘도",
        stayInfo:
            "정선하이원 리조트에 처음으로 가봤는데\n정말 크고 건물도 여러개있더라구요\n왜 셀프체크인 하는지 알것같았어요",
        location: "강원 정선군 고한읍 고한리 1-239",
        notice:
            "리조트 시설 확인 및 운영여부, 운영시간, 기타문의 등 하이원리조트 대표번호 (1588-7789) 문의 부탁 드립니다",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "정선하이원 리조트에 처음으로 가봤는데\n정말 크고 건물도 여러개있더라구요\n왜 셀프체크인 하는지 알것같았어요",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel4.png",
        stayName: "스카이베이호텔 경포",
        stayInfo:
            "번화한 경포 해수욕장에 자리 잡은 호텔로 탁 트인 바다 전망을 감상할 수 있습니다\n현대적이고 고급스러운 객실에서 편안하게 휴식할 수 있습니다\n수영장과 레스토랑, 피트니스센터 등 다양한 편의시설을 갖추고 있습니다",
        location: "강원 강릉시 강문동 258-4",
        notice:
            "기본정보\n체크인 : 15:00 | 체크아웃 : 11:00\n22시 이후 체크인 시 호텔 프론트 문의\n무료 Wi-Fi\n전 객실 금연\n주차 가능 (무료 / 객실 당 1대)\n[그린 캠페인] 플라스틱 없는 호텔 만들기로 기본 욕실 어메니티 3종(샴푸, 린스, 바디워시) 이외에 1회 용품은 제공하지 않습니다",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "강릉의 랜드마크 호텔인 스파이베이 경포답게 전면은 시원한 바다뷰와 함께 경포해변이 보이고, 반대편으로는 넓은 경포호수가 보이는 뷰맛집 호텔이에요!",
          }
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel5.png",
        stayName: "제주신라호텔",
        stayInfo:
            "세계 자연문화유산인 제주의 아름다운 풍광을 담은 리조트로써 그 명성을 쌓아가고 있는 제주신라호텔은 1980년 개관부터 지금까지 품격과 문화가 있는 휴식지로서 수많은 굵직한 국제행사를 성공적으로 치러온 최고의 리조트입니다",
        location: "제주도 서귀포시 색달동 3039-3",
        notice:
            "입실 : 15:00 | 퇴실 : 11:00\n객실은 현장배정(고객 지정 불가)\n동계 시즌 가스난로 이용 시 1박당 20,000원 추가됩니다",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "세월의 흔적이 있지만 너무나 청결한 숙소 정말 오랜만에 찾았는데 여전하면서 세련됐어요. 신라호텔에만 있어도 될 것 같아요.",
          }
        ],
      ),
      Stay(
        stayImgTitle: "hotel/hotel6.png",
        stayName: "힐튼 경주",
        stayInfo:
            "국내외 귀빈들이 머물렀던 최고 수준의 힐튼호텔에서 특별한 하루를 보낼 수 있습니다\n보문호수 부근에 위치해 경주의 주요 관광지로의 뛰어난 접근성을 자랑합니다\n심플하고 모던한 분위기의 속의 세련되고 편안한 라이프스타일을 반영한 객실에서 비즈니스와 여가를 모두 누리기에 좋습니다",
        location: "경북 경주시 신평동 370",
        notice:
            "기본정보\n체크인 : 15:00 | 체크아웃 : 11:00\n무료 Wi-Fi\n전 객실 금연\nBath Amenity (치약, 칫솔 유료)\n주차가능 (무료 / 객실당 1대)",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "경주힐튼에 대한 리뷰도 이번이 세번째는 되는거 같아요~제가 사는 곳이 대구다보니 가족들과 접근성이 좋은 경주로 자주 가게 되는거 같아요 ",
          }
        ],
      ),
    ];
  }
}
