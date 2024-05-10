class Reservation {
  final int reservationId;
  final int userId;
  final String stayName;
  final String stayAddress;
  final double price;
  final int roomId;
  final String roomName;
  final int date;  // 변경: DateTime에서 int로
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
    required this.date,  // 변경: 타입 수정
    required this.checkInDate,
    required this.checkOutDate,
    this.roomImgTitle = '',
    this.reservationName = '',
    this.reservationTel = '',
  });
  @override
  String toString() {
    return 'Reservation(reservationId: $reservationId, userId: $userId, stayName: $stayName, stayAddress: $stayAddress, price: $price, roomId: $roomId, roomName: $roomName, date: $date, checkInDate: $checkInDate, checkOutDate: $checkOutDate, roomImgTitle: $roomImgTitle, reservationName: $reservationName, reservationTel: $reservationTel)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationId: json['reservationId'],
      userId: json['userId'],
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: json['price']?.toDouble() ?? 0.0,
      roomId: json['roomId'],
      roomName: json['roomName'] ?? 'Unknown',
      date: json['date'],  // 변경: DateTime.parse 제거
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      roomImgTitle: json['roomImgTitle'] ?? '',
      reservationName: json['reservationName'] ?? '',
      reservationTel: json['reservationTel'] ?? '',
    );
  }
}
