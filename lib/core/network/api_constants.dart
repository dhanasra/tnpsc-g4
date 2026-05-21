class ApiConstants {

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';

  // endpoints
  static const String login = '/auth/login';
  static const String profile = '/user/profile';
}