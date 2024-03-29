import 'package:dio/dio.dart';

import '../../global/constants.dart';
import '../../global/global_context.dart';
import '../../storage/session_storage.dart';

class AuthInterceptor extends Interceptor {
  final SessionStorage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GlobalContext.instance.loginExpire();
    } else {
      handler.next(err);
    }
    super.onError(err, handler);
  }
}
