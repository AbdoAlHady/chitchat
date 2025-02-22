import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/helper/connection_helper.dart';
import 'package:chitchat/core/network/error_handler.dart';
import 'package:chitchat/features/auth/data/models/login_request_body.dart';
import 'package:chitchat/features/auth/data/models/login_response.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/message_response.dart';
import 'package:chitchat/features/auth/data/models/resend_email_verification_request_body.dart';
import 'package:chitchat/features/auth/data/models/verify_email_request_body.dart';

import '../../../../core/network/api_service.dart';

class AuthDatasource {
  final ApiService _apiService;

  AuthDatasource({required ApiService apiService}) : _apiService = apiService;

  Future<MessageResponse> register(
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
      throw ServerException(message: ErrorHandler.hanlde(error).message!);
    }
  }

  Future<MessageResponse> verifyEmail(
      VerifyEmailRequestBody verifyEmailRequestBody) async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _apiService.verifyEmail(verifyEmailRequestBody);
      return response;
    } on NetworkException {
      rethrow;
    } catch (error) {
      throw ServerException(message: ErrorHandler.hanlde(error).message!);
    }
  }

  // Resend verification email
  Future<MessageResponse> resendVerificationEmail(String email) async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _apiService.resendEmailVerificationCode(
          ResendEmailVerificationRequestBody(email: email));
      return response;
    } on NetworkException {
      rethrow;
    } catch (error) {
      throw ServerException(message: ErrorHandler.hanlde(error).message!);
    }
  }

  // Login
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _apiService.login(loginRequestBody);
      return response;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw ServerException(message: ErrorHandler.hanlde(e).message!);
    }
  }
}
