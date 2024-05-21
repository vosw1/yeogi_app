class StayInfo {
  final int id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String description;
  final String stayImgTitle;

  StayInfo({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.stayImgTitle,
  });
}

final List<StayInfo> hotels = [
  StayInfo(
    id: 4,
    name: '이비스 앰배서더 부산 시티호텔',
    address: '부산시 부산진구 중앙대로 110 (부전동)',
    latitude: 35.158891,
    longitude: 129.058833,
    description: '부산 중심지에 위치한 편리한 시티호텔입니다.',
    stayImgTitle: 'hotel7.png',
  ),
  StayInfo(
    id: 5,
    name: '브라운도트 호텔 서면 1호점',
    address: '부산시 부산진구 중앙대로 692-18 (부전동)',
    latitude: 35.156637,
    longitude: 129.061267,
    description: '서면 중심에 자리한 아늑한 호텔입니다.',
    stayImgTitle: 'hotel8.png',
  ),
  StayInfo(
    id: 6,
    name: '토요코인호텔 부산서면',
    address: '부산시 부산진구 서전로30번길 17-1 (부전동)',
    latitude: 35.155701,
    longitude: 129.060156,
    description: '경제적이면서 깨끗한 호텔입니다.',
    stayImgTitle: 'hotel9.png',
  ),
  StayInfo(
    id: 2,
    name: '호텔티티 서면',
    address: '부산시 부산진구 중앙대로 658 (부전동)',
    latitude: 35.156993,
    longitude: 129.058897,
    description: '서면에서 휴식을 취할 수 있는 아늑한 호텔입니다.',
    stayImgTitle: 'hotel10.png',
  ),
  StayInfo(
    id: 3,
    name: '롯데호텔 서면',
    address: '부산시 부산진구 중앙대로 771 (부전동)',
    latitude: 35.156131,
    longitude: 129.058197,
    description: '서면의 중심에 자리한 고급 호텔입니다.',
    stayImgTitle: 'hotel11.png',
  ),
];
