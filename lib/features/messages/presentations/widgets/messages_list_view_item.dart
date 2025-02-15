import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/messages/presentations/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class MessagesListViewItem extends StatelessWidget {
  const MessagesListViewItem({super.key});

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
        itemCount: 10,
        itemBuilder: (context, index) => MessageTile(),
      ),
    ));
  }
}
