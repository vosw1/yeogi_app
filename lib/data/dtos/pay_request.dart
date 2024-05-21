import 'package:flutter/material.dart';

class PaySaveReqDTO {
  final int reservationId;
  final int payId;
  final int amount;
  final String way;
  final String state;
  final DateTime payAt;

  PaySaveReqDTO({
    required this.reservationId,
    required this.payId,
    required this.amount,
    required this.way,
    required this.state,
    required this.payAt,
  });

  factory PaySaveReqDTO.fromJson(Map<String, dynamic> json) {
    return PaySaveReqDTO(
      reservationId: json['reservationId'],
      payId: json['payId'],
      amount: json['amount'],
      way: json['way'],
      state: json['state'],
      payAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'payId': payId,
      'amount': amount,
      'way': way,
      'state': state,
      'payAt': payAt.toIso8601String(),  // Fixed key from 'paytAt' to 'payAt'
    };
  }
}
