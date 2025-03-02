import 'package:chitchat/features/messages/presentation/widgets/chat_input.dart';
import 'package:chitchat/features/messages/presentation/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          ChatListViewItems(),
          ChatInput(),
        ],
      ),
    );
  }
}

class ChatListViewItems extends StatelessWidget {
  const ChatListViewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ChatItem();
        },
      ),
    );
  }
}
