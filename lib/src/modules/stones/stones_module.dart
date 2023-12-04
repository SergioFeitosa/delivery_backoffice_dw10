import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/stones/stone_repository.dart';
import '../../repositories/stones/stone_repository_impl.dart';
import 'detail/stone_detail_controller.dart';
import 'detail/stone_detail_page.dart';
import 'home/stones_controller.dart';
import 'home/stones_page.dart';

class StonesModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(StonesController.new);
    i.addLazySingleton(StoneDetailController.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);
    i.addLazySingleton<StoneRepository>(StoneRepositoryImpl.new);


  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const StonesPage());
    r.child(
      '/detail',
      child: (context) => StoneDetailPage(
        stoneId: int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
  }
}
