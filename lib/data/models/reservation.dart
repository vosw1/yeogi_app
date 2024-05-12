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
    // 'price' 값을 JSON 데이터에서 가져오기
    final dynamic priceData = json['price'];
    // priceData가 null이면 0으로 설정
    final int price = priceData != null ? int.tryParse(priceData.toString()) ?? 0 : 0;

    // checkInDate 및 checkOutDate를 파싱하기 전에 값이 null인지 확인
    final String? checkInDateString = json['checkInDate'];
    final String? checkInTimeString = json['checkInTime'];
    final String? checkOutDateString = json['checkOutDate'];
    final String? checkOutTimeString = json['checkOutTime'];

    final DateTime checkInDate = checkInDateString != null && checkInTimeString != null
        ? DateTime.parse(checkInDateString + ' ' + checkInTimeString)
        : DateTime.now(); // 널 값이면 기본값으로 설정

    final DateTime checkOutDate = checkOutDateString != null && checkOutTimeString != null
        ? DateTime.parse(checkOutDateString + ' ' + checkOutTimeString)
        : DateTime.now(); // 널 값이면 기본값으로 설정

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
      roomImgTitle: json['roomImgTitle'] ?? '',
      reservationName: json['reservationName'] ?? '',
      reservationTel: json['reservationTel'] ?? '',
    );
  }
}
