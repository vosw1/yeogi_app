// // 예약 기본 틀
// class Book {
//   final String roomImgTitle; // 숙소 이미지 제목
//   final String stayName; // 숙소 이름
//   final String roomName; // 방 이름
//   final String location; // 위치
//   final DateTime checkInDate; // 체크인 날짜와 시간
//   final DateTime checkOutDate; // 체크아웃 날짜와 시간
//   final int price; // 가격
//   final String bookName; // 예약자 이름
//   final String bookTel; // 예약자 전화번호
//   final String way; // 결제 방법
//   final DateTime payAt; // 결제 일자
//
//   Book({
//     required this.roomImgTitle,
//     required this.stayName,
//     required this.roomName,
//     required this.location,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.price,
//     required this.bookName,
//     required this.bookTel,
//     required this.way,
//     required this.payAt,
//   });
// }
//
// // Map<String, dynamic> toJson() => {
// //   "id": id,
// //   "title": title,
// //   "content": content,
// //   "user": user,
// //   "createdAt": createdAt,
// //   "updatedAt": updatedAt,
// // };
//
// // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
//
// // Book.fromJson(Map<String, dynamic> json)
// //     : id = json["id"],
// // title = json["title"],
// // content = json["content"],
// // user = User.fromJson(json["user"]),
// // createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]),
// // updatedAt = DateFormat("yyyy-mm-dd").parse(json["updated"]);
// //
// // String getUpdated() {
// // return DateFormat.MMMd().format(updatedAt!);
// // }
//
