import 'package:chitchat/core/utils/cache_helper.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      setupHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void setupHeaders() async {
    dio!.options.headers = {
      'Authorization':
          'Bearer ${await CacheHelper.getSecuredString(PrefsKeys.token) ?? ""}',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseBody: true));
  }
}
