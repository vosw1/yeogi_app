// 국내 해외 예약 기본 틀
class BookItemData {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String roomName; // 방 이름
  final String location; // 위치
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String personCount; // 사람수
  final int price; // 가격

  BookItemData({
    required this.stayImgTitle,
    required this.stayName,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.personCount,
    required this.price,
  });
}
