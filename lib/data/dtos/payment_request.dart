import 'package:flutter/material.dart';

class PaymentSaveReqDTO {
  final String paymentId;
  final String reservationId;
  final int amount;
  final String way;
  final String state;
  final DateTime paymentAt;

  PaymentSaveReqDTO({
    required this.paymentId,
    required this.reservationId,
    required this.amount,
    required this.way,
    required this.state,
    required this.paymentAt,
  });

  factory PaymentSaveReqDTO.fromJson(Map<String, dynamic> json) {
    return PaymentSaveReqDTO(
      paymentId: json['paymentId'],
      reservationId: json['reservationId'],
      amount: json['amount'],
      way: json['way'],
      state: json['state'],
      paymentAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'reservationId': reservationId,
      'amount': amount,
      'way': way,
      'state': state,
      'paymentAt': paymentAt.toIso8601String(),
    };
  }
}
