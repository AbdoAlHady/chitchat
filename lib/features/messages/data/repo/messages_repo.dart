import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/errors/failure.dart';
import 'package:chitchat/features/messages/data/data_source/messages_datasource.dart';
import 'package:chitchat/features/messages/data/models/message_response.dart';
import 'package:dartz/dartz.dart';

class MessagesRepo {
  final MessagesDatasource _datasource;

  MessagesRepo(this._datasource);

  Future<Either<Failure, List<MessageDataModel>>> getMessages(
      {required String conversationId}) async {
    try {
      final result =
          await _datasource.getAllMessages(conversationId: conversationId);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
