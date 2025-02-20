import 'package:chitchat/core/network/api_service.dart';
import 'package:chitchat/core/network/dio_factroy.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  Dio dio = DioFactory.getDio();

  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
