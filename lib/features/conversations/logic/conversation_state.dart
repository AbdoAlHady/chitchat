part of 'conversation_cubit.dart';

class ConversationState extends Equatable {
  final List<ConversationModel> conversations;
  final StateType getAllConversationsState;
  final String errorMessage;

  const ConversationState(
      {List<ConversationModel>? conversationList,
      this.getAllConversationsState = StateType.initial,
      this.errorMessage = ''})
      : conversations = conversationList ?? const [];

  @override
  List<Object> get props => [
        conversations,
        getAllConversationsState,
        errorMessage,
      ];

  ConversationState copyWith({
    List<ConversationModel>? conversations,
    StateType? getAllConversationsState,
    String? errorMessage,
  }) {
    return ConversationState(
      conversationList: conversations ?? this.conversations,
      getAllConversationsState:
          getAllConversationsState ?? this.getAllConversationsState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
