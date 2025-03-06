import 'package:chitchat/features/messages/data/models/message_response.dart';
import 'package:chitchat/features/messages/presentation/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatListViewItems extends StatelessWidget {
  const ChatListViewItems({
    super.key,
    required this.messages,
  });
  final List<MessageDataModel> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ChatItem(message: messages[index]);
        },
      ),
    );
  }
}
