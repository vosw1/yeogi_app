class Reservation {
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

  Reservation({
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
  });

  @override
  String toString() {
    return 'Reservation('
        'reservationId: $reservationId, '
        'reservationName: $reservationName, '
        'reservationTel: $reservationTel, '
        'checkInDate: $checkInDate, '
        'checkOutDate: $checkOutDate, '
        'roomId: $roomId, '
        'stayAddress: $stayAddress, '
        'roomName: $roomName, '
        'roomImgTitle: $roomImgTitle, '
        'price: $price)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationId: json['reservationId'].toString(),
      reservationName: json['stayName'] ?? "Default Name",
      // Providing a default value if null
      reservationTel: json['reservationTel'] ?? "Default Tel",
      checkInDate:
          DateTime.parse(json['checkInDate'] + ' ' + json['checkInTime']),
      checkOutDate:
          DateTime.parse(json['checkOutDate'] + ' ' + json['checkOutTime']),
      roomId: json['roomId'].toString(),
      stayAddress: json['stayAddress'] ?? "Default Address",
      roomName: json['roomName'] ?? "Default Room Name",
      roomImgTitle: json['roomName'],
      // Assuming roomImgTitle is same as roomName if not provided
      price: json['price'],
    );
  }
}
