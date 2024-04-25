// 국내 해외 상품 기본 틀
class ItemData {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String stayInfo; // 숙소 특이사항
  final String roomName; // 방 이름
  final String roomInfo; // 방 정보
  final String amenities; // 방 편의시설
  final String location; // 위치
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String personCount; // 사람수
  final int price; // 가격
  final String cancellationAndRefundPolicy; // 취소 및 환불 정책
  final String notice; // 여어떻노 공지
  final String userImgTitle;// 유저 프로필 이미지
  final double starCount; // 별점
  final String comment; // 리뷰 내용
  final String userName; // 리뷰 작성한 유저네임


  ItemData({
    required this.stayImgTitle,
    required this.stayName,
    required this.stayInfo,
    required this.roomName,
    required this.roomInfo,
    required this.amenities,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.personCount,
    required this.price,
    required this.cancellationAndRefundPolicy,
    required this.notice,
    required this.userImgTitle,
    required this.starCount,
    required this.comment,
    required this.userName,
  });
}