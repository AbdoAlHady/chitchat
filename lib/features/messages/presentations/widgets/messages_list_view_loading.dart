import 'package:chitchat/core/helper/dummy_data.dart';
import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/messages/presentations/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MessagesListViewLoading extends StatelessWidget {
  const MessagesListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final conversationList = generateRandomConversations(10);
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: AppColors.messageListPage,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: conversationList.length,
          itemBuilder: (context, index) => MessageTile(
            conversation: conversationList[index],
          ),
        ),
      ),
    ));
  }
}
