

class Option {
  final id; // 옵션 번호
  final stayId; // 옵션를 가진 숙소 번호
  final name; // 옵션 이름
  final iconName; // 옵션 아이콘 이름
  final createdAt; // 생성 일자

  // 숙소 상세 보기
  final optionId; // 숙소 이미지 아이디

  Option({
    required this.id,
    this.stayId,
    this.name,
    this.iconName,
    this.createdAt,

    // 숙소 상세 보기
    this.optionId,
  });

  // Convert Stay object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id ?? "",
      "stayId": stayId ?? "",
      "name": name ?? "",
      "iconName": iconName ?? "",
      "createdAt": createdAt ?? "",

      // 숙소 상세 보기
      "optionId": optionId ?? "",
    };
  }

  // Convert JSON data to Stay object
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] ?? "",
      stayId: json['stayId'] ?? "",
      name: json['name'] ?? "",
      iconName: json['iconName'] ?? "",
      createdAt: json['createdAt'] ?? "",

      // 숙소 상세 보기
      optionId: json['optionId'] ?? "",
    );
  }
}
