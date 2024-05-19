class ResponseDTO {
  int? status;
  String? errorMessage;
  dynamic body;

  ResponseDTO({
    this.status,
    this.errorMessage,
    this.body,
  });

  @override
  String toString() {
    return 'ResponseDTO(status: $status, message: $errorMessage, body: $body)';
  }

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        errorMessage = json['errorMessage'] as String?,
        body = _parseListData(json['body']);

  static dynamic _parseListData(dynamic data) {
    if (data is List) {
      return data.map((item) => Map<String, dynamic>.from(item)).toList();
    } else {
      return data;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errorMessage': errorMessage,
      'body': body,
    };
  }
}
