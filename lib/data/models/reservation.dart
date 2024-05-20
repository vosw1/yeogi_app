class Reservation {
  final int reservationId;
  final int id;
  final List<String> reservedDates;
  final int userId;
  final int? reviewId;
  final String stayName;
  final String stayAddress;
  final int price;
  final int roomId;
  final String roomName;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final String? roomImgTitle;
  final String reservationName;
  final String reservationTel;
  final int payId;
  final int amount;
  final String way;
  final String state;
  final DateTime createdAt;

  Reservation({
    required this.reservationId,
    required this.id,
    required this.reservedDates,
    required this.userId,
    this.reviewId,
    required this.stayName,
    required this.stayAddress,
    required this.price,
    required this.roomId,
    required this.roomName,
    required this.checkInDate,
    required this.checkOutDate,
    this.roomImgTitle,
    required this.reservationName,
    required this.reservationTel,
    required this.payId,
    required this.amount,
    required this.way,
    required this.state,
    required this.createdAt,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationId:
          json['id'] is int ? json['id'] : int.parse(json['id'] ?? '0'),
      id: json['id'] is int ? json['id'] : int.parse(json['id'] ?? '0'),
      reservedDates:
          (json['reservedDates'] as List<dynamic>? ?? []).cast<String>(),
      userId: json['userId'] is int
          ? json['userId']
          : int.parse(json['userId'] ?? '0'),
      reviewId: json['reviewId'] != null
          ? (json['reviewId'] is int
              ? json['reviewId']
              : int.parse(json['reviewId']))
          : null,
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: json['price'] is int
          ? json['price']
          : int.parse(json['price'] ?? '0'),
      roomId: json['roomId'] is int
          ? json['roomId']
          : int.parse(json['roomId'] ?? '0'),
      roomName: json['roomName'] ?? 'Unknown',
      checkInDate:
          DateTime.parse(json['checkInDate'] ?? DateTime.now().toString()),
      checkOutDate:
          DateTime.parse(json['checkOutDate'] ?? DateTime.now().toString()),
      roomImgTitle: json['roomImgTitle'],
      reservationName: json['reservationName'] ?? 'Unknown',
      reservationTel: json['reservationTel'] ?? 'Unknown',
      payId: json['payId'] != null
          ? (json['payId'] is int ? json['payId'] : int.parse(json['payId']))
          : 0,
      amount: json['amount'] is int
          ? json['amount']
          : int.parse(json['amount'] ?? '0'),
      way: json['way'] ?? 'Unknown',
      state: json['state'] ?? 'Unknown',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  @override
  String toString() {
    return 'Reservation{'
        'reservationId: $reservationId, '
        'id: $id, '
        'reservedDates: $reservedDates, '
        'userId: $userId, '
        'reviewId: $reviewId, '
        'stayName: $stayName, '
        'stayAddress: $stayAddress, '
        'price: $price, '
        'roomId: $roomId, '
        'roomName: $roomName, '
        'checkInDate: $checkInDate, '
        'checkOutDate: $checkOutDate, '
        'roomImgTitle: $roomImgTitle, '
        'reservationName: $reservationName, '
        'reservationTel: $reservationTel, '
        'payId: $payId, '
        'amount: $amount, '
        'way: $way, '
        'state: $state, '
        'createdAt: $createdAt'
        '}';
  }
}
