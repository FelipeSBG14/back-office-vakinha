import 'package:dio/dio.dart';
import '../../global/constants.dart';
import '../../global/global_context.dart';
import '../../storage/storage.dart';

class AuthInterceptors extends Interceptor {
  final Storage storage;

  AuthInterceptors(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      GlobalContext.i.loginExpire();
    } else {
      handler.next(err);
    }
  }
}
