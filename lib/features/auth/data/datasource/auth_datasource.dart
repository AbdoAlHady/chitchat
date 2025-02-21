import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/helper/connection_helper.dart';
import 'package:chitchat/core/network/error_handler.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/register_response.dart';

import '../../../../core/network/api_service.dart';

class AuthDatasource {
  final ApiService _apiService;

  AuthDatasource({required ApiService apiService}) : _apiService = apiService;

  Future<RegisterResponse> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _apiService.register(registerRequestBody);
      return response;
    } on NetworkException {
      rethrow;
    } catch (error) {
      throw NetworkException(message: ErrorHandler.hanlde(error).message!);
    }
  }
}
