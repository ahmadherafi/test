import 'package:dio/dio.dart';

class DioInstance {
  Dio? _dio;
  String? baseUrl;
  DioInstance({this.baseUrl});

  Dio get dio => _dio ?? _instantiate();

  Dio _instantiate() {
    Dio dio = Dio(
      BaseOptions(
          baseUrl: baseUrl ?? "https://ani.point-dev.net/api/",
          connectTimeout: const Duration(seconds: 5)

          // receiveDataWhenStatusError: true,
          ),
    );

    dio.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
