class ResponseDTO {
  final int? status;
  final String? errorMessage;
  late final dynamic body;

  ResponseDTO({
    this.status,
    this.errorMessage,
    this.body,
  });

  @override
  String toString() {
    return 'ResponseDTO(status: $status, errorMessage: $errorMessage, body: $body)';
  }

  factory ResponseDTO.fromJson(Map<String, dynamic> json) {
    return ResponseDTO(
      status: json['status'] as int?,
      errorMessage: json['errorMessage'] as String?,
      body: _parseListData(json['body']),
    );
  }

  static dynamic _parseListData(dynamic data) {
    if (data is List) {
      return data.map((item) => Map<String, dynamic>.from(item)).toList();
    }
    return data;
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errorMessage': errorMessage,
      'body': body,
    };
  }
}
