class Book {
  final String stayName; // 숙소 이름
  final String roomImgTitle; // 방 이미지 제목
  final String roomName; // 방 이름
  final String location; // 위치
  final DateTime checkInDate; // 체크인 날짜와 시간
  final DateTime checkOutDate; // 체크아웃 날짜와 시간
  final int price; // 가격
  final String bookName; // 예약자 이름
  final String bookTel; // 예약자 전화번호
  final String way; // 결제 방법
  final DateTime payAt; // 결제 일자

  Book({
    required this.stayName,
    required this.roomImgTitle,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.bookName,
    required this.bookTel,
    required this.way,
    required this.payAt,
  });
}
