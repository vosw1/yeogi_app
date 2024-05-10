class Reservation {
  final int reservationId;
  final int userId;
  final String stayName;
  final String stayAddress;
  final int price;
  final int roomId;
  final String roomName;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final String roomImgTitle;
  final String reservationName;
  final String reservationTel;

  Reservation({
    required this.reservationId,
    required this.userId,
    required this.stayName,
    required this.stayAddress,
    required this.price,
    required this.roomId,
    required this.roomName,
    required this.checkInDate,
    required this.checkOutDate,
    this.roomImgTitle = '',
    this.reservationName = '',
    this.reservationTel = '',
  });

  @override
  String toString() {
    return 'Reservation(reservationId: $reservationId, userId: $userId, stayName: $stayName, stayAddress: $stayAddress, price: $price, roomId: $roomId, roomName: $roomName, checkInDate: $checkInDate, checkOutDate: $checkOutDate, roomImgTitle: $roomImgTitle, reservationName: $reservationName, reservationTel: $reservationTel)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    // 'price' 값을 JSON 데이터에서 직접 가져오고 문자열로 변환 후 숫자로 파싱
    int price = int.tryParse(json['price'].toString()) ?? 0;

    return Reservation(
      reservationId: json['reservationId'] ?? 0,
      userId: json['userId'] ?? 0,
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: price, // 문자열로부터 변환된 가격 사용
      roomId: json['roomId'] ?? 0,
      roomName: json['roomName'] ?? 'Unknown',
      checkInDate: DateTime.parse(json['checkInDate'] + ' ' + json['checkInTime']),
      checkOutDate: DateTime.parse(json['checkOutDate'] + ' ' + json['checkOutTime']),
      roomImgTitle: json['roomImgTitle'] ?? '',
      reservationName: json['reservationName'] ?? '',
      reservationTel: json['reservationTel'] ?? '',
    );
  }
}
