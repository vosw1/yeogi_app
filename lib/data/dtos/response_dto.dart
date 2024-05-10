class ResponseDTO {
  int? status;
  String? errorMessage;
  dynamic response;

  ResponseDTO({
    required this.status,
    this.errorMessage,
    this.response,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json["status"] ?? 0, // 값이 없으면 기본값으로 0 설정
        errorMessage = json["msg"] ?? '',
        response = json["body"];
}
