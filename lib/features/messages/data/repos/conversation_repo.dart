import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/errors/failure.dart';
import 'package:chitchat/features/messages/data/data_source/conversation_datasource.dart';
import 'package:chitchat/features/messages/data/models/conversation_model.dart';
import 'package:dartz/dartz.dart';

class ConversationRepo {
  final ConversationDatasource remoteDataSource;

  ConversationRepo({required this.remoteDataSource});

  Future<Either<Failure, List<ConversationModel>>> getAllConversations() async {
    try {
      final conversations = await remoteDataSource.getAllConversations();
      return Right(conversations);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
