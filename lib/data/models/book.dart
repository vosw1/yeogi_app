class Book {
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String checkInTime; // 입실
  final String checkOutTime; // 퇴실
  final String bookName; // 예약자 이름
  final String bookTel; // 예약자 전화번호
  final int price; // 가격

  Book({
    required this.roomImgTitle,
    required this.roomName,
    required this.checkInDate,
    required this.checkOutDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.bookName,
    required this.bookTel,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      roomImgTitle: json['roomImgTitle'],
      roomName: json['roomName'],
      checkInDate: json['checkInDate'],
      checkOutDate: json['checkOutDate'],
      checkInTime: json['checkInTime'],
      checkOutTime: json['checkOutTime'],
      bookName: json['bookName'],
      bookTel: json['bookTel'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomImgTitle': roomImgTitle,
      'roomName': roomName,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'bookName': bookName,
      'bookTel': bookTel,
      'price': price,
    };
  }
}
