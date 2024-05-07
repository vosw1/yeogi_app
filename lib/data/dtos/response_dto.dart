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
      : success = json["success"], // bool로 변환하고, 값이 없을 경우 기본값으로 false 설정
        status = json["status"], // int로 변환하고, 값이 없을 경우 기본값으로 0 설정
        errorMessage = json["errorMessage"] ?? '',
        response = json["response"] ?? '';

}
