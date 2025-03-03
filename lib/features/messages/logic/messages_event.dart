part of 'messages_bloc.dart';

sealed class MessagesEvent extends Equatable {
  const MessagesEvent();
  @override
  List<Object> get props => [];
}

final class GetAllMessagesEvent extends MessagesEvent {
  final String conversationId;

  const GetAllMessagesEvent({required this.conversationId});
}

final class SendMessageEvent extends MessagesEvent {
  final String conversationId;
  final String content;

  const SendMessageEvent({required this.conversationId, required this.content});
}

class ReciveMessageEvent extends MessagesEvent {
  final Map<String, dynamic> message;

  const ReciveMessageEvent({required this.message});
}
