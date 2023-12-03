// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../models/agronegocio_model.dart';

class OrderAgronegocioDto {
  final AgronegocioModel agronegocio;
  final int amount;
  final double totalPrice;
  OrderAgronegocioDto({
    required this.agronegocio,
    required this.amount,
    required this.totalPrice,
  });

}
