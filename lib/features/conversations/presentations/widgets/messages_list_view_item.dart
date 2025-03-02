import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/conversations/data/models/conversation_response.dart';
import 'package:chitchat/features/conversations/presentations/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class MessagesListViewItem extends StatelessWidget {
  const MessagesListViewItem({super.key, required this.conversations});
  final List<ConversationModel> conversations;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: AppColors.messageListPage,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) => MessageTile(
          conversation: conversations[index],
        ),
      ),
    ));
  }
}
