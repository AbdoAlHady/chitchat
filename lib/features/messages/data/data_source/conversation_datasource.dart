import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/helper/connection_helper.dart';
import 'package:chitchat/core/network/api_service.dart';
import 'package:chitchat/core/network/error_handler.dart';
import 'package:chitchat/features/messages/data/models/conversation_model.dart';

class ConversationDatasource {
  final ApiService _service;

  ConversationDatasource(this._service);

  Future<ConversationModel> getAllConversations() async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _service.getAllConversations();
      return response;
    } on NetworkException {
      rethrow;
    } catch (error) {
      throw ServerException(message: ErrorHandler.hanlde(error).message!);
    }
  }
}
