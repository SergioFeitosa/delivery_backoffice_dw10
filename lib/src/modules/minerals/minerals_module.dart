import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/minerals/mineral_repository.dart';
import '../../repositories/minerals/mineral_repository_impl.dart';
import 'detail/mineral_detail_controller.dart';
import 'detail/mineral_detail_page.dart';
import 'home/minerals_controller.dart';
import 'home/minerals_page.dart';

class MineralsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(MineralsController.new);
    i.addLazySingleton(MineralDetailController.new);
    i.addLazySingleton<MineralRepository>(MineralRepositoryImpl.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MineralsPage());
    r.child(
      '/detail',
      child: (context) => MineralDetailPage(
        mineralId: int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
  }
}
