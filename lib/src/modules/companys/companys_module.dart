import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/company/company_repository.dart';
import '../../repositories/company/company_repository_impl.dart';
import 'detail/company_detail_controller.dart';
import 'detail/company_detail_page.dart';
import 'home/companys_controller.dart';
import 'home/companys_page.dart';

class CompanysModule extends Module {

  @override
  void binds(i) {
    i.addLazySingleton(CompanysController.new);
    i.addLazySingleton(CompanyDetailController.new);
    i.addLazySingleton<CompanyRepository>(CompanyRepositoryImpl.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CompanysPage());
    r.child(
      '/detail',
      child: (context) => CompanyDetailPage(
        companyId: int.tryParse(r.args.queryParams['id'] ?? 'não informado'),
      ),
    );
  }

}
