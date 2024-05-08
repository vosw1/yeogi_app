class ResponseDTO {
  bool success;
  int status;
  String? errorMessage;
  dynamic response;

  ResponseDTO({
    required this.success,
    required this.status,
    this.errorMessage,
    this.response,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"] ?? false, // 값이 없으면 기본값으로 false 설정
        status = json["status"] ?? 0, // 값이 없으면 기본값으로 0 설정
        errorMessage = json["errorMessage"] ?? '',
        response = json["response"];

}
