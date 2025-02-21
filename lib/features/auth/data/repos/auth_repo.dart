import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/errors/failure.dart';

import 'package:chitchat/features/auth/data/datasource/auth_datasource.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/register_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  late final AuthDatasource _authDatasource;

  Future<Either<Failure, RegisterResponse>> register(
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
}
