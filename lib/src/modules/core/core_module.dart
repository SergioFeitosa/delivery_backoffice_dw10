import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/agronegocios/agronegocio_repository.dart';
import '../../repositories/agronegocios/agronegocio_repository_impl.dart';
import '../../repositories/company/company_repository.dart';
import '../../repositories/company/company_repository_impl.dart';
import '../../repositories/minerals/mineral_repository.dart';
import '../../repositories/minerals/mineral_repository_impl.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import '../../repositories/stones/stone_repository.dart';
import '../../repositories/stones/stone_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';

class CoreModule extends Module {

  @override
  void binds(i) {
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
    i.addLazySingleton<AgronegocioRepository>(AgronegocioRepositoryImpl.new);
    i.addLazySingleton<MineralRepository>(MineralRepositoryImpl.new);
    i.addLazySingleton<StoneRepository>(StoneRepositoryImpl.new);
    i.addLazySingleton<CompanyRepository>(CompanyRepositoryImpl.new);
    i.addLazySingleton<PaymentTypeRepository>(PaymentTypeRepositoryImpl.new);
    i.addLazySingleton<ProductRepository>(ProductRepositoryImpl.new);
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);

  }
}

