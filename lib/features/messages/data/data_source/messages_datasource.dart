import 'package:chitchat/core/errors/exceptions.dart';
import 'package:chitchat/core/helper/connection_helper.dart';
import 'package:chitchat/core/network/api_service.dart';
import 'package:chitchat/core/network/error_handler.dart';
import 'package:chitchat/features/messages/data/models/message_response.dart';

class MessagesDatasource {
  final ApiService _apiService;

  MessagesDatasource({required ApiService apiService})
      : _apiService = apiService;

  Future<List<MessageDataModel>> getAllMessages(
      {required String conversationId}) async {
    try {
      final isConnected = await ConnectionHelper().checkInternetConnection();
      if (isConnected) {
        final response = await _apiService.getMessages(conversationId);
        return response.data;
      } else {
        throw NetworkException(
            message: 'No internet connection found, please try again later');
      }
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw ServerException(message: ErrorHandler.hanlde(e).message!);
    }
  }
}
