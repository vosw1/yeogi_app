class Reservation {
  final int reservationId;
  final int userId;
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
    required this.userId,
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
    return 'Reservation(reservationId: $reservationId, userId: $userId, stayName: $stayName, stayAddress: $stayAddress, price: $price, roomId: $roomId, roomName: $roomName, checkInDate: $checkInDate, checkOutDate: $checkOutDate, roomImgTitle: $roomImgTitle, reservationName: $reservationName, reservationTel: $reservationTel, payId: $payId, amount: $amount, way: $way, state: $state)';
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    print("Parsing JSON: $json"); // 추가된 로그

    final int price = json['price'] != null ? int.tryParse(json['price'].toString()) ?? 0 : 0;

    // 날짜와 시간을 합쳐서 파싱
    final String checkInDateStr = json['checkInDate'] ?? '';
    final String checkInTimeStr = json['checkInTime'] ?? '';
    final String checkOutDateStr = json['checkOutDate'] ?? '';
    final String checkOutTimeStr = json['checkOutTime'] ?? '';

    final DateTime checkInDate = DateTime.parse('$checkInDateStr $checkInTimeStr');
    final DateTime checkOutDate = DateTime.parse('$checkOutDateStr $checkOutTimeStr');

    return Reservation(
      reservationId: json['reservationId'] ?? 0,
      userId: json['userId'] ?? 0,
      stayName: json['stayName'] ?? 'Unknown',
      stayAddress: json['stayAddress'] ?? 'Unknown',
      price: price,
      roomId: json['roomId'] ?? 0,
      roomName: json['roomName'] ?? 'Unknown',
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      roomImgTitle: json['roomImageName'] ?? 'room1.jpg',
      reservationName: json['reservationName'] ?? 'Unknown',
      reservationTel: json['reservationTel'] ?? 'Unknown',
      payId: json['payId'] ?? 0,
      amount: json['amount'] ?? 0,
      way: json['way'] ?? 'Unknown',
      state: json['payState'] ?? 'Unknown',
      createdAt: DateTime.parse(json['payAt'] ?? DateTime.now().toString()),
    );
  }
}
