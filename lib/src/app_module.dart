import 'package:flutter_modular/flutter_modular.dart';
import 'core/rest_client/custom_dio.dart';
import 'core/storage/session_storage.dart';
import 'core/storage/session_storage_impl.dart';
import 'modules/agronegocios/agronegocios_module.dart';
import 'modules/companys/companys_module.dart';
import 'modules/login/login_module.dart';
import 'modules/minerals/minerals_module.dart';
import 'modules/order/order_module.dart';
import 'modules/payment_type/payment_type_module.dart';
import 'modules/products/products_module.dart';
import 'modules/stones/stones_module.dart';
import 'modules/template/base_layout.dart';

class AppModule extends Module {
  

  @override
  void binds(i) {
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);

  }



  @override
  void routes(r) {
    r.module('/login', module: LoginModule());
    r.child(
      '/',
      child: (context) => const BaseLayout(
            body: RouterOutlet(),
      ),
          transition: TransitionType.noTransition,
          children: [
            ModuleRoute(
              '/payment-type',
              module: PaymentTypeModule(),
            ),
            ModuleRoute(
              '/agronegocios',
              module: AgronegociosModule(),
            ),
            ModuleRoute(
              '/minerals',
              module: MineralsModule(),
            ),
            ModuleRoute(
              '/stones',
              module: StonesModule(),
            ),
            ModuleRoute(
              '/companys',
              module: CompanysModule(),
            ),
            ModuleRoute(
              '/products',
              module: ProductsModule(),
            ),
            ModuleRoute(
              '/order',
              module: OrderModule(),
            ),
          ],
    );
  }  
}
