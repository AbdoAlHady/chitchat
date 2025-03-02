import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/features/conversations/data/models/conversation_response.dart';
import 'package:chitchat/features/conversations/data/repos/conversation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._repo) : super(ConversationState());
  final ConversationRepo _repo;

  void getAllConversations() async {
    emit(state.copyWith(getAllConversationsState: StateType.loading));
    final result = await _repo.getAllConversations();
    result.fold(
        (failure) => emit(state.copyWith(
            getAllConversationsState: StateType.error,
            errorMessage: failure.message)),
        (conversations) => emit(state.copyWith(
            getAllConversationsState: StateType.success,
            conversations: conversations)));
  }
}
