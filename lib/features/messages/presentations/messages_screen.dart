import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/features/messages/data/repos/conversation_repo.dart';
import 'package:chitchat/features/messages/logic/conversation_cubit.dart';
import 'package:chitchat/features/messages/presentations/widgets/messages_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ConversationCubit(sl<ConversationRepo>())..getAllConversations(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: MessagesScreenBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Messages',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
