import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:chitchat/features/messages/data/models/conversation_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.conversation});
  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(Routes.chatScreen);
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://images.pexels.com/photos/19399100/pexels-photo-19399100/free-photo-of-palestinian.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
      ),
      title: Text(
        conversation.participanName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        conversation.lastMessage,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey),
        maxLines: 1,
      ),
      trailing: Text(
        DateFormat('hh:mm a')
            .format(DateTime.parse(conversation.lastMessageTime).toLocal()),
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
