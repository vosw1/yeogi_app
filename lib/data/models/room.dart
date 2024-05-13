class Room {
  final int roomId;
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String roomInfo; // 룸 정보
  final String personCount; // 룸 정보
  final String amenities; // 룸
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String checkInTime; // 입실
  final String checkOutTime; // 퇴실
  final int price; // 가격
  final int? specialPrice; // 할인된 가격 (null일 수 있음)
  final String notice; // 여어떻노 공지

  // 숙소 상세 보기
  final roomTier;
  final roomPrice;
  final roomSpecialState;
  final roomSpecialPrice;
  final roomImagePath;


  Room({
    required this.roomId,
    required this.roomImgTitle,
    required this.roomName,
    required this.roomInfo,
    required this.personCount,
    required this.amenities,
    required this.checkInDate,
    required this.checkOutDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.price,
    required this.specialPrice,
    required this.notice,

    // 숙소 상세 보기
    this.roomTier,
    this.roomPrice,
    this.roomSpecialState,
    this.roomSpecialPrice,
    this.roomImagePath,
  });

  @override
  String toString() {
    return 'Room(roomId: $roomId, roomImgTitle: $roomImgTitle, roomName: $roomName, roomInfo: $roomInfo, personCount: $personCount, amenities: $amenities, checkInDate: $checkInDate, checkOutDate: $checkOutDate, checkInTime: $checkInTime, checkOutTime: $checkOutTime, price: $price, specialPrice: $specialPrice, notice: $notice, roomTier: $roomTier, roomPrice: $roomPrice, roomSpecialState: $roomSpecialState, roomSpecialPrice: $roomSpecialPrice, roomImagePath: $roomImagePath)';
  }


  factory Room.fromJson(Map<String, dynamic> json) {

    // 'roomId' 값을 JSON 데이터에서 가져오기
    final dynamic roomIdData = json['roomId'] ?? 0;
    // roomIdData가 null이거나 int 타입이 아니면 기본값인 0으로 설정
    final int roomId = roomIdData != null ? int.tryParse(roomIdData.toString()) ?? 1 : 1;


    // 'price' 값을 JSON 데이터에서 가져오기
    final dynamic priceData = json['price'] ?? 0;
    // priceData가 null이면 0으로 설정
    final int price =
    priceData != null ? int.tryParse(priceData.toString()) ?? 0 : 0;

    // 'specialPrice' 값을 JSON 데이터에서 가져오기
    final dynamic specialPriceData = json['specialPrice'] ?? 0;
    // specialPriceData가 null이면 null로 설정
    final int? specialPrice =
    specialPriceData != null ? int.tryParse(specialPriceData.toString()) : null;

    return Room(
      roomId: roomId,
      roomImgTitle: json["roomImgTitle"] ?? "",
      roomName: json["roomName"] ?? "",
      roomInfo: json["roomInfo"] ?? "",
      personCount: json["personCount"] ?? "",
      amenities: json["amenities"] ?? "",
      checkInDate: json["checkInDate"] ?? "",
      checkOutDate: json["checkOutDate"] ?? "",
      checkInTime: json["checkInTime"] ?? "",
      checkOutTime: json["checkOutTime"] ?? "",
      price: json["price"] ?? 0,
      specialPrice: specialPrice,
      notice: json["notice"] ?? "",

      // 숙소 상세 보기
      roomTier: json["roomTier"] ?? "",
      roomPrice: json["roomPrice"] ?? 0,
      roomSpecialState: json["roomSpecialState"] ?? "",
      roomSpecialPrice: json["roomSpecialPrice"] ?? 0,
      roomImagePath: json["roomImagePath"] ?? "",
    );
  }
}

