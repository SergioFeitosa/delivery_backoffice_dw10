import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class OrderAgronegocioModel {
  final int agronegocioId;
  final int amount;
  final double totalPrice;

  OrderAgronegocioModel({
    required this.agronegocioId,
    required this.amount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': agronegocioId,
      'amount': amount,
      'total_price': totalPrice,
    };
  }

  factory OrderAgronegocioModel.fromMap(Map<String, dynamic> map) {
    return OrderAgronegocioModel(
      agronegocioId: (map['id'] ?? 0) as int,
      amount: (map['amount'] ?? 0) as int,
      totalPrice: (map['total_price'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderAgronegocioModel.fromJson(String source) =>
      OrderAgronegocioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
