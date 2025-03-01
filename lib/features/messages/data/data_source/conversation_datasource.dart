import 'dart:developer';

import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/helper/connection_helper.dart';
import 'package:chitchat/core/network/api_service.dart';
import 'package:chitchat/core/network/error_handler.dart';
import 'package:chitchat/features/messages/data/models/conversation_response.dart';

class ConversationDatasource {
  final ApiService _service;

  ConversationDatasource(this._service);

  Future<List<ConversationModel>> getAllConversations() async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (!isConnected) {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
      final response = await _service.getAllConversations();
      return response.conversations;
    } on NetworkException {
      rethrow;
    } catch (error) {
      log('Error: $error');
      throw ServerException(message: ErrorHandler.hanlde(error).message!);
    }
  }
}
