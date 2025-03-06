part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  final List<MessageDataModel>? messages;

  const MessagesState({this.messages});

  @override
  List<Object?> get props => [messages];
}

final class MessagesLoadingState extends MessagesState {
  const MessagesLoadingState({super.messages});
}

final class MessagesSuccessState extends MessagesState {
  const MessagesSuccessState({super.messages});
}

final class MessagesErrorState extends MessagesState {
  final String message;

  const MessagesErrorState({required this.message});
}
