import 'package:intl/intl.dart'; // Import DateFormat for date parsing

class Book {
  final String stayImgTitle; // 숙소 이미지 제목
  final String stayName; // 숙소 이름
  final String roomName; // 방 이름
  final String location; // 위치
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String personCount; // 사람수
  final int price; // 가격

  Book({
    required this.stayImgTitle,
    required this.stayName,
    required this.roomName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.personCount,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
    "stayImgTitle": stayImgTitle,
    "stayName": stayName,
    "roomName": roomName,
    "location": location,
    "checkInDate": checkInDate,
    "checkOutDate": checkOutDate,
    "personCount": personCount,
    "price": price,
  };

  // FromJson constructor to convert JSON to Book object
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      stayImgTitle: json["stayImgTitle"],
      stayName: json["stayName"],
      roomName: json["roomName"],
      location: json["location"],
      checkInDate: json["checkInDate"],
      checkOutDate: json["checkOutDate"],
      personCount: json["personCount"],
      price: json["price"],
    );
  }

  // Method to format updatedAt date
  // String getUpdated() {
  //   return DateFormat.MMMd().format(updatedAt!);
  // }
}
