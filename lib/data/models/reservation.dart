class Reservation {
  final String userId;
  final String reservationId;
  final String reservationName;
  final String reservationTel;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final String roomId;
  final String stayAddress;
  final String roomName;
  final String roomImgTitle;
  final int price;
  final DateTime createdAt;

  Reservation({
    required this.userId,
    required this.reservationId,
    required this.reservationName,
    required this.reservationTel,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomId,
    required this.stayAddress,
    required this.roomName,
    required this.roomImgTitle,
    required this.price,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Reservation('
        'userId: $userId, '
        'reservationId: $reservationId, '
        'reservationName: $reservationName, '
        'reservationTel: $reservationTel, '
        'checkInDate: $checkInDate, '
        'checkOutDate: $checkOutDate, '
        'roomId: $roomId, '
        'stayAddress: $stayAddress, '
        'roomName: $roomName, '
        'roomImgTitle: $roomImgTitle, '
        'createdAt: $createdAt, '
        'price: $price)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      userId: json['userId'].toString(),
      reservationId: json['reservationId'].toString(),
      reservationName: json['reservationName'] ?? "Default Name",
      // Providing a default value if null
      reservationTel: json['reservationTel'] ?? "Default Tel",
      checkInDate: json['checkInDate'] != null ? DateTime.parse(json['checkInDate'] + ' ' + json['checkInTime']) : DateTime.now(),
      checkOutDate: json['checkOutDate'] != null ? DateTime.parse(json['checkOutDate'] + ' ' + json['checkOutTime']) : DateTime.now(),
      roomId: json['roomId'].toString(),
      stayAddress: json['stayAddress'] ?? "Default Address",
      roomName: json['roomName'] ?? "Default Room Name",
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      roomImgTitle: json['roomImgTitle'] ?? json['roomName'] ?? "Default Room Image Title",
      // Assuming roomImgTitle is same as roomName if not provided
      price: json['price'] ?? 0,
    );
  }
}
