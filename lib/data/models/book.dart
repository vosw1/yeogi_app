class Book {
  final int roomId;
  final String stayName; // 숙소 이름
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String location; // 위치
  final DateTime checkInDate; // 체크인 날짜와 시간
  final DateTime checkOutDate; // 체크아웃 날짜와 시간
  final int price; // 가격
  final String bookName; // 예약자 이름
  final String bookTel; // 예약자 전화번호

  Book({
    required this.roomId,
    required this.stayName,
    required this.roomImgTitle,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.bookName,
    required this.bookTel,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      roomId: json['roomId'],
      stayName: json['stayName'],
      roomImgTitle: json['roomImgTitle'],
      roomName: json['roomName'],
      location: json['location'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      price: json['price'],
      bookName: json['bookName'],
      bookTel: json['bookTel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'stayName': stayName,
      'roomImgTitle': roomImgTitle,
      'roomName': roomName,
      'location': location,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'price': price,
      'bookName': bookName,
      'bookTel': bookTel,
    };
  }
}
