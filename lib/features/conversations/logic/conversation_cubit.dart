import 'dart:developer';

import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/features/conversations/data/models/conversation_response.dart';
import 'package:chitchat/features/conversations/data/repos/conversation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/socket_service.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._repo) : super(ConversationState()) {
    _initializeSoketListener();
  }
  final ConversationRepo _repo;
  final SocketService _socketService = SocketService();
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

  void _initializeSoketListener() {
    try {
      _socketService.socket.on('conversationUpdated', _onConversationUpdate);
    } on Exception catch (e) {
      log("Error in socket listener: $e");
    }
  }

  _onConversationUpdate(data) {
    getAllConversations();
  }
}
