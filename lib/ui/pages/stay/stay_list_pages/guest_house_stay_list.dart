import 'package:flutter/material.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/ui/pages/stay/stay_list_pages/stay_list_page.dart';

class GuestHouseStayList extends StayListPage {
  const GuestHouseStayList({Key? key}) : super(key: key, appBarTitle: '게스트하우스');

  @override
  List<Stay> getStayDataList() {
    return [
      // 게스트하우스 숙소 리스트
      Stay(
        stayImgTitle: "guest_house/guestHouse1.png",
        stayName: "전주 소소한 한옥",
        stayInfo: "소소하게 행복이 머무는 공간입니다\n #새로 오픈했어요",
        location: "전북특별자치도 전주시 완산구 풍남동2가 11-2",
        notice: "현장 요금 추가 정보\n인원 추가 시 1인 20000원(영유아 포함)",
        reviews: [
          {
            'starCount': 4,
            'comment': "시댁이 전주라 한옥마을 자주 이용하는편인데 지금까지 이용했던 숙소중에 제일 좋았어요~",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse2.png",
        stayName: "전주 한옥마을 한옥고택 고을",
        stayInfo:
            "안녕하세요! 한옥고택고을입니다\n천년의숨결 그대로, 그리고 전주한옥마을이 함께하는 곳\n휴식에 휴식을 더하는 힐링공간으로 초대합니다",
        location: "전라북도 전주시 완산구 풍남동3가 76-63",
        notice: "인원 추가 시 10,000원 (12개월 이상~성인), 12개월 미만 1인까지 무료 (단, 2명부터 요금 발생)",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "오랫만에 전주한옥마을에서 잤는데 공영주차장2 와 거리가 5~7분정도여서 빠르게 숙소에 들어갈 수 있었어요",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse3.png",
        stayName: "군산 여미랑",
        stayInfo:
            "여미랑(잊을 여, 못할 미, 사랑채 랑)은 아픈 역사를 잊지 말고 하룻밤 묵으면서 만든 추억도 잊지 말자는 의미로,\n일제시대의 아픔을 되새기고자 만들어진 근대역사의 체험공간이자 숙박시설입니다",
        location: "전북 군산시 월명동 16-8",
        notice: "체크인 15~23시까지 (늦은 체크인 미리 연락 필수)\n애완동물 동반 입실 불가",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "설 연휴에 아이와 함께 가족 여행 다녀왔습니다^^사진에서 봤던것 보다 더 아기자기 하고 예쁘고 관리가 잘된 캠핑장이었구요^^",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse4.png",
        stayName: "경주 행복 한옥마을 셔블",
        stayInfo:
            "신라 천년이 이야기가 있는 신라 왕릉과 돌담길, 정감이 있는 한옥\n더불어 “셔블”\n“행복 한옥마을 셔블”에 오신 것을 환영합니다.",
        location: "경상북도 경주시 황남동 76-10",
        notice:
            " PM 11 : 00 시 이후 소등\n객실 내 식음 금지\n시설물을 파손하거나 침구류 훼손 및 오염 (세탁 불가능) 시 전액 배상",
        reviews: [
          {
            'starCount': 5,
            'comment': "한옥 숙소는 처음 가봣는데 전체적으로 만족 햇어요 ",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse5.png",
        stayName: "전주 한옥마을 골목길 게스트하우스",
        stayInfo:
            "인거리100m옆.도보1분\n모든방은 한옥 민박 가족방입니다.가족*연인*친구가 따로따로 주무시는 방1개와화장실1개의 독립적인 방입니다.\n4인까지 무조건 추가요금 전혀없이 숙박합니다.",
        location: "전라북도 전주시 완산구 교동 45-6 전주골목길게스트하우스",
        notice:
            "입실 : 15:00 | 퇴실 : 11:00\n객실은 현장배정(고객 지정 불가)\n동계 시즌 가스난로 이용 시 1박당 20,000원 추가됩니다",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "겨울에 방문하고 날씨가 따뜻해 지고 다시 한번 골목길 게스트하우스에 하루 쉬어갔습니다~\n여전히 깨끗하고 아늑해서  넘 좋았습니다~ 보일러도  나에게 맞게 조절 할 수 있어서 밤에 따뜻하게 잘 잤습니다.",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
      Stay(
        stayImgTitle: "guest_house/guestHouse6.png",
        stayName: "경주 신라고택",
        stayInfo:
            "황리단길 중심지에 위치하며,주변에 유명 맛집/커피숍/술집.상가 형성되어있습니다.\n주변관광지는(대릉원도보 5분거리,첨성대도보10분거리,안압지 도보 15분거리,교촌마을(월정교)도보 15분 거리\n국립박물관 도보 15분거리)소요됩니다.",
        location: "경상북도 경주시 황남동 229-33  번지",
        notice:
            "20시 이후 체크인 시 사전 문의 필수\n객실 내 취사 불가, 공용개수대 및 주방 시설 이용가능\n카라반 전 객실 요금은 2인 기준이며, 최대 3인까지 투숙가능\n(성인 3명은 비좁을 수 있으니 가급적 가족단위 3인까지 이용 요망)\n[당일이용-숙박불가]피크닉 상품 이용안내\n\n(7세 미만 추가금 없음 -> 고기 미제공)",
        reviews: [
          {
            'starCount': 5,
            'comment':
                "늦은시간에 체크인을 했는데 친절하게 맞이해주시던 사장님!!!!\n숙소는 제가 넘  조아하는 아늑함\n여기는 민박도 아닌 여관도 아닌 요즘 핫한 한옥숙소느낌!",
          },
          {
            'starCount': 4,
            'comment':
            "좋았어요 ",
          }
        ],
      ),
    ];
  }
}
