part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  final List<MessageDataModel>? messages;

  const MessagesState({this.messages});

  @override
  List<Object> get props => [messages!];
}

final class MessagesInitial extends MessagesState {
  MessagesInitial() : super(messages: []);
}

final class MessagesLoading extends MessagesState {
  const MessagesLoading();
}

final class MessagesSuccess extends MessagesState {
  const MessagesSuccess({super.messages});
}

final class MessagesError extends MessagesState {
  final String message;

  const MessagesError({required this.message});
}
