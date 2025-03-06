import 'dart:developer';

import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
import 'package:chitchat/features/messages/data/models/message_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.message});
  final MessageDataModel message;

  @override
  Widget build(BuildContext context) {
    log("userId: $userId");
    return Align(
      alignment: userId == message.senderId
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: userId == message.senderId
              ? AppColors.receiverMessage
              : AppColors.senderMessage,
          borderRadius: _buildBorder(),
        ),
        child: Text(message.content),
      ),
    );
  }

  BorderRadius _buildBorder() {
    return BorderRadius.only(
      topRight:
          userId == message.senderId ? Radius.circular(0) : Radius.circular(20),
      topLeft:
          userId == message.senderId ? Radius.circular(20) : Radius.circular(0),
      bottomRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );
  }
}
