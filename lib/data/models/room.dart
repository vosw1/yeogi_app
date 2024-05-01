// 숙소 기본 틀
class Room {
  final String roomImgTitle; // 숙소 이미지 제목
  final String roomName; // 방 이름
  final String roomInfo; // 방 정보
  final String amenities; // 방 편의시설
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String checkInTime; // 입실
  final String checkOutTime; // 퇴실
  final int price; // 가격
  final String notice; // 여어떻노 공지


  Room({
    required this.roomImgTitle,
    required this.roomName,
    required this.roomInfo,
    required this.amenities,
    required this.checkInDate,
    required this.checkOutDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.price,
    required this.notice,
  });
}