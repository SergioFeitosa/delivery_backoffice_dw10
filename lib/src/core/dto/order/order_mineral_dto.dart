// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../models/mineral_model.dart';

class OrderMineralDto {
  final MineralModel mineral;
  final int amount;
  final double totalPrice;
  OrderMineralDto({
    required this.mineral,
    required this.amount,
    required this.totalPrice,
  });

}
