import 'package:dio/dio.dart';

class NetworkProvider {
  static Dio instance() {
    final dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    //authorization=authorization;
    //  dio.options.contentType = contentType ?? Headers.formUrlEncodedContentType;
    // dio.options.headers['language'] = 'en';
    //dio.options.headers["ApiEncrypted"] = "true";
    // dio.options.headers['cookie'] = cookie;
    //  dio.options.headers['Content-Type']= contentType ?? "application/x-www-form-urlencoded";
    dio.options.headers['accept'] = 'application/json, text/plain, */*';
    //dio.options.connectTimeout = 10000;
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    // dio.interceptors.add(alice.getDioInterceptor());
    // dio.interceptors.add(alice.showInspector());

    return dio;
  }
}
