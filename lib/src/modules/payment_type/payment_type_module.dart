import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import 'payment_type_controller.dart';
import 'payment_type_page.dart';

class PaymentTypeModule extends Module {


  @override
  void binds(i) {
    i.addLazySingleton(PaymentTypeController.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
    i.addLazySingleton<PaymentTypeRepository>(PaymentTypeRepositoryImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const PaymentTypePage());
  }
}
