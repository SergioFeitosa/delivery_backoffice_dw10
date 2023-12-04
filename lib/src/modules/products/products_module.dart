import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import 'detail/product_detail_controller.dart';
import 'detail/product_detail_page.dart';
import 'home/products_controller.dart';
import 'home/products_page.dart';

class ProductsModule extends Module {

  @override
  void binds(i) {
    i.addLazySingleton(ProductsController.new);
    i.addLazySingleton(ProductDetailController.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
    i.addLazySingleton<ProductRepository>(ProductRepositoryImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProductsPage());
    r.child(
      '/detail',
      child: (context) => ProductDetailPage(
        productId: int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
  }
}
