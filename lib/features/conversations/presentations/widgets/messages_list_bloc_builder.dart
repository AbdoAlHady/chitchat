import 'package:chitchat/features/conversations/logic/conversation_cubit.dart';
import 'package:chitchat/features/conversations/presentations/widgets/messages_list_view_item.dart';
import 'package:chitchat/features/conversations/presentations/widgets/messages_list_view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/state_type.dart';

class MessagesListBlocBuilder extends StatelessWidget {
  const MessagesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, ConversationState>(
      builder: (context, state) {
        switch (state.getAllConversationsState) {
          case StateType.initial:
          case StateType.loading:
            return MessagesListViewLoading();
          case StateType.success:
            return MessagesListViewItem(conversations: state.conversations);
          case StateType.empty:
            return const Text('No messages found');
          case StateType.error:
            return Text(state.errorMessage);
        }
      },
    );
  }
}
