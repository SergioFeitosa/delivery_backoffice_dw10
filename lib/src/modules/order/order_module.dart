import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/order/order_repository.dart';
import '../../repositories/order/order_repository_impl.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/order/get_order_by_id.dart';
import '../../services/order/get_order_by_id_impl.dart';
import 'order_controller.dart';
import 'order_page.dart';

class OrderModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<OrderRepository>(OrderRepositoryImpl.new);
    i.addLazySingleton<GetOrderById>(GetOrderByIdImpl.new);
    i.addLazySingleton(OrderController.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
    i.addLazySingleton<PaymentTypeRepository>(PaymentTypeRepositoryImpl.new);
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton<ProductRepository>(ProductRepositoryImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const OrderPage());
  }
}
