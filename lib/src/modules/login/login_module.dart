import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/session_storage_impl.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';
import '../../services/auth/login_service.dart';
import '../../services/auth/login_service_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {

  @override
  void binds(i) {
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton<LoginService>(LoginServiceImpl.new);
    i.addLazySingleton<LoginController>(LoginController.new);
    i.addLazySingleton<CustomDio>(CustomDio.new);
    i.addLazySingleton<SessionStorage>(SessionStorageImpl.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
