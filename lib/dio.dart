import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fsc;
import 'package:my_tasks/constants.dart';

Future<Dio> getApiClient() async {
  var dio = Dio();

  dio.options.baseUrl = kBaseURL;
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;

  dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
    final storage = fsc.FlutterSecureStorage();
    final isToken = await storage.containsKey(key: 'token');
    if (isToken) {
      final token = await storage.read(key: 'token');
      options.headers["Authorization"] = "Token " + token;
    }
    // print(options.baseUrl + options.path);
    return handler.next(options);
  }, onResponse: (Response response, handler) {
    return handler.next(response);
  }, onError: (DioError error, handler) async {
    return handler.next(error);
  }));

  return dio;
}
