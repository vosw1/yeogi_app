class Reservation {
  final int reservationId;
  final int reservedDates;
  final int userId;
  final int reviewId;
  final String stayName;
  final String stayAddress;
  final int price;
  final int roomId;
  final String roomName;
  late final DateTime checkInDate;
  late final DateTime checkOutDate;
  final String? roomImgTitle;
  final String reservationName;
  final String reservationTel;
  final int payId;
  final int amount;
  final String way;
  late final String state;
  final DateTime createdAt;

  Reservation({
    required this.reservationId,
    required this.reservedDates,
    required this.userId,
    required this.reviewId,
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

  @override
  String toString() {
    return 'Reservation(reservationId: $reservationId, reservedDates: $reservedDates, userId: $userId, reviewId: $reviewId, stayName: $stayName, stayAddress: $stayAddress, price: $price, roomId: $roomId, roomName: $roomName, checkInDate: $checkInDate, checkOutDate: $checkOutDate, roomImgTitle: $roomImgTitle, reservationName: $reservationName, reservationTel: $reservationTel, payId: $payId, amount: $amount, way: $way, state: $state, createdAt: $createdAt)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    // Ensure correct type conversion for price
    final dynamic priceData = json['price'];
    final int price = priceData != null ? int.tryParse(priceData.toString()) ?? 0 : 0;

    // Parse dates and times correctly
    final String? checkInDateString = json['checkInDate'];
    final String? checkInTimeString = json['checkInTime'];
    final String? checkOutDateString = json['checkOutDate'];
    final String? checkOutTimeString = json['checkOutTime'];

    final DateTime checkInDate = checkInDateString != null && checkInTimeString != null
        ? DateTime.parse('$checkInDateString $checkInTimeString')
        : DateTime.now(); // Default value if null

    final DateTime checkOutDate = checkOutDateString != null && checkOutTimeString != null
        ? DateTime.parse('$checkOutDateString $checkOutTimeString')
        : DateTime.now(); // Default value if null

    return Reservation(
      reservationId: json['reservationId'] is int ? json['reservationId'] : int.parse(json['reservationId'] ?? '0'),
      reservedDates: json['reservedDates'] is int ? json['reservedDates'] : int.parse(json['reservedDates'] ?? '0'),
      userId: json['userId'] is int ? json['userId'] : int.parse(json['userId'] ?? '0'),
      reviewId: json['reviewId'] is int ? json['reviewId'] : int.parse(json['reviewId'] ?? '0'),
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: price,
      roomId: json['roomId'] is int ? json['roomId'] : int.parse(json['roomId'] ?? '0'),
      roomName: json['roomName'] ?? 'Unknown',
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      roomImgTitle: json['roomImageName'] ?? '',
      reservationName: json['reservationName'] ?? 'Unknown',
      reservationTel: json['reservationTel'] ?? 'Unknown',
      payId: json['payId'] is int ? json['payId'] : int.parse(json['payId'] ?? '0'),
      amount: json['amount'] is int ? json['amount'] : int.parse(json['amount'] ?? '0'),
      way: json['way'] ?? 'Unknown',
      state: json['state'] ?? 'Unknown',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }
}
