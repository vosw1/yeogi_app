// 결제 기본 틀
class Payment {
  final String way; // 결제 방법
  final DateTime payAt; // 결제 일자

  Payment({
    required this.way,
    required this.payAt,
  });
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      way: json['way'],
      payAt: DateTime.parse(json['payAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'way': way,
      'payAt': payAt.toIso8601String(),
    };
  }
}