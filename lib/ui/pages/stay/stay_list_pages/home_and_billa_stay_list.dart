import 'package:flutter/cupertino.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

import '../../../../data/models/stay.dart';

class HomeAndBillaStayList extends StayListPage {
  const HomeAndBillaStayList({Key? key}) : super(key: key, appBarTitle: '홈&빌라');

  @override
  List<Stay> getStayDataList() {
    return [
      // 홈 앤 빌라 숙소 리스트
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla1.png",
        stayName: "테라스 제공,서울역도보 3분,서울역뷰,남산타워뷰 | 쿤테라스",
        stayInfo: "NEW! 테라스 제공, 서울역도보 3분, 서울역뷰, 남산타워뷰",
        location: "서울 용산구 서계동 33-56",
        notice:
            "입실 : 15시 / 퇴실 12시\n오후 10시 이후에는 사전 문의 필수\n객실 구성 : 객실 2개+거실+욕실\n침구 구성 : 퀸+퀸",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "늦은 저녁 서울역에 도착하는 분들(뚜벅이)은 걸어서 10분이내 도착할 수 있어 좋아요 야경으로 서울역과 남산타워도 볼 수 있",
          },
          {
            'starCount': 4.5,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla2.png",
        stayName: "옥상테라스, 무료주차 한층전체 사용가능 | 광주 노브스튜디오",
        stayInfo:
            "광주중심가에 위치한 사진 스팟 노브파티룸 하우스입니다~^^\n1층 전체 35평 최대 10명까지 사용가능하고 신규오픈이라 세련되고 깨끗하며 옥상 테라스까지 사용 가능한 노브파티룸에서 즐거운 추억 많이 쌓으시길 바랍니다~^^",
        location: "광주 동구 수기동 106-1",
        notice:
            "숙소 이용규칙\n인원 추가 비용 : 1인 15,000원 (대인) / 영유아, 소인 무료 (인원 추가 하실 경우 010-8618-3634로 전화 부탁드립니다.)\n침구 추가 비용 : 무료\n금연 물품사용시 깨끗이 사용 / 물품 파손시 변상해야함",
        reviews: [
          {
            'starCount': 5,
            'comment': "엄청 넓어요 예민하지 않으시면 위치도 좋고 다니기 좋아요",
          },
          {
            'starCount': 4.5,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla3.png",
        stayName: "안동 어울림하우스 1호점",
        stayInfo:
            "하회마을, 도산서원, 월영교 야경, 신세동벽화마을, 임청각, 안동찜닭, 간고등어정식, 헛제삿밥, 맘모스제과점, 안동맛집\n젊은 부부가 운영하며, 안동맛집 맘모스제과점 도보로 이동가능, 숙박객들의 편안하고 안전한 여행을 중요시하는 한옥게스트하우스입니다. :-)",
        location: "경경북 안동시 동문동 163-3",
        notice:
            "입실 : 15시 / 퇴실 11시\n오후 10시 이후에는 사전 문의 필수\n 객실 구성\n1번방, 2번방 : 객실+욕실\n가족방 : 복층형 (객실+거실+욕실)\n침대\n1번방, 2번방 : 더블 1개\n가족방 : 싱글 4개",
        reviews: [
          {
            'starCount': 5,
            'comment': "작은 창문이 있는 방이네요^^ 가성비 좋은 방으로 약간의 고택느낌으로 지내실 수 있어요. ",
          },
          {
            'starCount': 4.5,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla4.png",
        stayName: "한 팀만 독채로 머물 수 있는 | 군산 찰리하우스 안채",
        stayInfo:
            "이성당, 초원사진관, 히로스가옥,근대역사박물관,동국사등 주요 관광지를 도보 5분 안에 갈 수 있는 최적의 위치",
        location: "전북특별자치도 군산시 신창동 49-20",
        notice: "입실 : 15시 / 퇴실 11시\n오후 10시 이후에는 사전 문의 필수\n객실 구성 : 객실 2개+거실+욕실",
        reviews: [
          {
            'starCount': 5,
            'comment': "깨끗하고 좋았습니다!",
          },
          {
            'starCount': 4.5,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla5.png",
        stayName: "넓은 공간으로 여러명이 머물기 적합한 숙소 | 하우스오브갤러리 301",
        stayInfo:
            "넓은 공간으로 여러 명이 함께 머물기 적합하고 중심부에 위치한 숙소입니다.\n관광숙박업등록업체, 현금영수증,신용카드가능",
        location: "대구 남구 대명동 139-12",
        notice:
            "숙소 이용규칙\n인원 추가 비용 : 기준인원 초과시 추가요금 발생 / 영유아 인원수 포함 / 최대인원 초과불가 / 현장 결제\n조식서비스 : 문의",
        reviews: [
        ],
      ),
      Stay(
        stayImgTitle: "home_and_billa/homeAndBilla6.png",
        stayName: "군산 관광중심지에 위치한 | 군산 찰리하우스 바깥채",
        stayInfo:
            "청결을 가장 중요하게 여기는 5성급 호텔 못지 않은 쾌적한 공간\n골목 안쪽에 자리하여 소음으로 부터 차단된 아늑하고 조용한 숙소다",
        location: "전북특별자치도 군산시 신창동 49-20",
        notice: "입실 : 15시 / 퇴실 11시\n오후 10시 이후에는 사전 문의 필수\n객실 구성 : 객실 2개+거실+욕실",
        reviews: [
        ],
      ),
    ];
  }
}
