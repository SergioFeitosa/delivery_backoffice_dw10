import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/orders/order_status.dart';
import '../../models/orders/order_model.dart';
import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio _dio;

  OrderRepositoryImpl(this._dio);

  @override
  Future<void> changeStatus(int id, OrderStatus status) async {
    try {
      await _dio.auth().put(
        '/orders/$id',
        data: {
          'status': status.acronym,
        },
      );
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log(
        'Erro ao alterar status do pedido para ${status.acronym}',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        'Erro ao alterar status do pedido para ${status.acronym}',
      );
    }
  }

  @override
  Future<List<OrderModel>> findAllOrders(
    DateTime date, [
    OrderStatus? status,
  ]) async {
    try {
      final orderResponse = await _dio.auth().get(
        '/orders',
        queryParameters: {
          'date': date.toIso8601String(),
          if (status != null) 'status': status.acronym,

        },
      );
      return orderResponse.data
          .map<OrderModel>((o) => OrderModel.fromMap(o))
          .toList();
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log(
        'Erro ao buscar Pedidos',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        'Erro ao buscar Pedidos Repositorio',
      );
    }
  }

  @override
  Future<OrderModel> getById(int id) async {
    try {
      final orderResponse = await _dio.auth().put(
            '/orders/$id',
          );
      return OrderModel.fromMap(orderResponse.data);
    // ignore: deprecated_member_use
    } on DioError catch (e, s) {
      log(
        'Erro ao buscar Pedido $id',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        'Erro ao buscar Pedido $id',
      );
    }
  }
}
