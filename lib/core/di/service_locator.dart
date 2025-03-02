import 'package:chitchat/core/network/api_service.dart';
import 'package:chitchat/core/network/dio_factroy.dart';
import 'package:chitchat/features/auth/data/datasource/auth_datasource.dart';
import 'package:chitchat/features/auth/data/repos/auth_repo.dart';
import 'package:chitchat/features/conversations/data/data_source/conversation_datasource.dart';
import 'package:chitchat/features/conversations/data/repos/conversation_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  Dio dio = DioFactory.getDio();

  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Auth
  sl.registerLazySingleton<AuthDatasource>(
      () => AuthDatasource(apiService: sl()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(authDatasource: sl()));

  // Conversations
  sl.registerLazySingleton<ConversationDatasource>(
      () => ConversationDatasource(sl()));
  sl.registerLazySingleton<ConversationRepo>(
      () => ConversationRepo(remoteDataSource: sl()));
}
