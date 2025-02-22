import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/errors/failure.dart';

import 'package:chitchat/features/auth/data/datasource/auth_datasource.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/message_response.dart';
import 'package:chitchat/features/auth/data/models/verify_email_request_body.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  final AuthDatasource _authDatasource;

  AuthRepo({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  Future<Either<Failure, MessageResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await _authDatasource.register(registerRequestBody);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // Verify Email
  Future<Either<Failure, MessageResponse>> verifyEmail(
      VerifyEmailRequestBody verifyEmailRequestBody) async {
    try {
      final response =
          await _authDatasource.verifyEmail(verifyEmailRequestBody);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  // Resend verification email
  Future<Either<Failure, MessageResponse>> resendVerificationEmail(
      String email) async {
    try {
      final response = await _authDatasource.resendVerificationEmail(email);
      return Right(response);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
