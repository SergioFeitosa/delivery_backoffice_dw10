import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/agronegocios/agronegocio_repository.dart';
import '../../repositories/agronegocios/agronegocio_repository_impl.dart';
import 'detail copy/agronegocio_presentation_controller.dart';
import 'detail copy/agronegocio_presentation_page.dart';
import 'detail/agronegocio_detail_controller.dart';
import 'detail/agronegocio_detail_page.dart';
import 'home/agronegocios_controller.dart';
import 'home/agronegocios_page.dart';

class AgronegociosModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AgronegociosController.new);
    i.addLazySingleton(AgronegocioDetailController.new);
    i.addLazySingleton(AgronegocioPresentationController.new);
    i.addLazySingleton<AgronegocioRepository>(AgronegocioRepositoryImpl.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AgronegociosPage());
    r.child(
      '/detail',
      child: (context) => AgronegocioDetailPage(
        agronegocioId:
            int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
    r.child(
      '/presentation',
      child: (context) => AgronegocioPresentationPage(
        agronegocioId:
            int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
  }
}
