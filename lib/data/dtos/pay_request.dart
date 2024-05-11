import 'package:flutter/material.dart';

class PaySaveReqDTO {
  final int payId;
  final int reservationId;
  final int amount;
  final String way;
  final String state;
  final DateTime payAt;

  PaySaveReqDTO({
    required this.payId,
    required this.reservationId,
    required this.amount,
    required this.way,
    required this.state,
    required this.payAt,
  });

  factory PaySaveReqDTO.fromJson(Map<String, dynamic> json) {
    return PaySaveReqDTO(
      payId: json['payId'] ?? "",
      reservationId: json['reservationId'],
      amount: json['amount'],
      way: json['way'],
      state: json['state'],
      payAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payId': payId,
      'reservationId': reservationId,
      'amount': amount,
      'way': way,
      'state': 'state',
      'paytAt': payAt.toIso8601String(),
    };
  }
}
