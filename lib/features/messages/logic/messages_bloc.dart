import 'dart:async';
import 'dart:developer';
import 'package:chitchat/core/services/socket_service.dart';
import 'package:chitchat/core/utils/cache_helper.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
import 'package:chitchat/features/messages/data/models/message_response.dart';
import 'package:chitchat/features/messages/data/repo/messages_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepo _repo;

  final SocketService _socketService = SocketService();
  MessagesBloc(this._repo) : super(MessagesLoadingState(messages: [])) {
    on<GetAllMessagesEvent>(_getAllMessages);
    on<SendMessageEvent>(_sendMessage);
    on<ReciveMessageEvent>(_reciveMessage);
  }

  FutureOr<void> _getAllMessages(event, emit) async {
    emit(MessagesLoadingState(messages: state.messages));
    final result =
        await _repo.getMessages(conversationId: event.conversationId);
    result
        .fold((failure) => {emit(MessagesErrorState(message: failure.message))},
            (messages) {
      emit(MessagesSuccessState(messages: messages));
      _socketService.socket.emit('joinConversation', event.conversationId);
      _socketService.socket.on('newMessage', (data) {
        log(data.toString());
        add(ReciveMessageEvent(message: data as Map<String, dynamic>));
      });
    });
  }

  FutureOr<void> _sendMessage(
      SendMessageEvent event, Emitter<MessagesState> emit) async {
    final userId = await CacheHelper.getSecuredString(PrefsKeys.userId);
    final message = {
      'conversationId': event.conversationId,
      'senderId': userId,
      'content': event.content
    };
    _socketService.socket.emit('sendMessage', message);
  }

  FutureOr<void> _reciveMessage(
      ReciveMessageEvent event, Emitter<MessagesState> emit) {
    log(event.message.toString());
    final MessageDataModel message = MessageDataModel.fromJson(event.message);
    emit(MessagesSuccessState(messages: [...?state.messages, message]));
  }
}
