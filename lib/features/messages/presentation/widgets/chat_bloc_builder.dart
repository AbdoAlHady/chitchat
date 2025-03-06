import 'package:chitchat/features/messages/logic/messages_bloc.dart';
import 'package:chitchat/features/messages/presentation/widgets/chat_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBlocBuilder extends StatelessWidget {
  const ChatBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        return switch (state) {
          MessagesLoadingState() => _onLoading(),
          MessagesSuccessState() => _onSuccess(state),
          MessagesErrorState() => _onError(state),
        };
      },
    );
  }

  Center _onError(MessagesErrorState state) =>
      Center(child: Text(state.message));

  ChatListViewItems _onSuccess(MessagesSuccessState state) =>
      ChatListViewItems(messages: state.messages!);

  Center _onLoading() => Center(child: CircularProgressIndicator());
}
