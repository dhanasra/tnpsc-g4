import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  bool isRefreshing = false;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !isRefreshing) {
      isRefreshing = true;

      try {
        // refresh token api call

        // retry original request
      } catch (e) {
        handler.next(err);
      }

      isRefreshing = false;
    }

    handler.next(err);
  }
}