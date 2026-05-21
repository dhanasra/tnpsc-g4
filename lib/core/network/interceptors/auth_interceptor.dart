import 'package:dio/dio.dart';

import '../api_constants.dart';
import '../token_manager.dart';

class AuthInterceptor extends Interceptor {
  final TokenManager tokenManager = TokenManager();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenManager.getAccessToken();

    if (token != null) {
      options.headers[ApiConstants.authorization] =
          '${ApiConstants.bearer} $token';
    }

    super.onRequest(options, handler);
  }
}