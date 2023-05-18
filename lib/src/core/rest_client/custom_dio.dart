import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/storage.dart';
import 'interceptors/auth_interceptors.dart';

class CustomDio extends DioForBrowser {
  late AuthInterceptors _authInterceptors;

  CustomDio(Storage storage)
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('backend_base_url'),
            connectTimeout: const Duration(
              seconds: 5,
            ),
            receiveTimeout: const Duration(
              seconds: 60,
            ),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptors = AuthInterceptors(storage);
  }

  CustomDio auth() {
    if (!interceptors.contains(_authInterceptors)) {
      interceptors.add(_authInterceptors);
    }
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptors);
    return this;
  }
}
