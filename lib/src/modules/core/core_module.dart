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
  List<Bind> get binds => [
        Bind.lazySingleton<SessionStorage>(
          (i) => SessionStorageImpl(),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => CustomDio(i()),
          export: true,
        ),
        Bind.lazySingleton<AgronegocioRepository>(
          (i) => AgronegocioRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<MineralRepository>(
          (i) => MineralRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<StoneRepository>(
          (i) => StoneRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<CompanyRepository>(
          (i) => CompanyRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<PaymentTypeRepository>(
          (i) => PaymentTypeRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<ProductRepository>(
          (i) => ProductRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(i()),
          export: true,
        ),
      ];
}
