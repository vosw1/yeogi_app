// 국내 해외 예약 기본 틀
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
}

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "title": title,
//   "content": content,
//   "user": user,
//   "createdAt": createdAt,
//   "updatedAt": updatedAt,
// };

// 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

// Book.fromJson(Map<String, dynamic> json)
//     : id = json["id"],
// title = json["title"],
// content = json["content"],
// user = User.fromJson(json["user"]),
// createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]),
// updatedAt = DateFormat("yyyy-mm-dd").parse(json["updated"]);
//
// String getUpdated() {
// return DateFormat.MMMd().format(updatedAt!);
// }

