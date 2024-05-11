class Pay {
  final int payId;
  final int reservationId;
  final int amount;
  final String way;
  final String state;
  final DateTime createdAt;

  Pay({
    required this.payId,
    required this.reservationId,
    required this.amount,
    required this.way,
    required this.state,
    required this.createdAt,
  });

  factory Pay.fromJson(Map<String, dynamic> json) {
    return Pay(
      payId: json['payId'],
      reservationId: json['reservationId'],
      amount: json['amount'],
      way: json['way'],
      state: json['state'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payId': payId,
      'reservationId': reservationId,
      'amount': amount,
      'way': way,
      'state': state,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
