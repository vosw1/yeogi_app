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
    return Reservation(
      reservationId: json['reservationId'] ?? 0,
      userId: json['userId'] ?? 0,
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: json['price'] ?? 0,
      roomId: json['roomId'] ?? 0,
      roomName: json['roomName'] ?? 'Unknown',
      checkInDate: DateTime.parse(json['checkInDate'] + ' ' + json['checkInTime']),
      checkOutDate: DateTime.parse(json['checkOutDate'] + ' ' + json['checkOutTime']),
    );
  }
}
