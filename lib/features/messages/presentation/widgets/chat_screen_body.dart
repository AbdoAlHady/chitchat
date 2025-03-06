import 'package:chitchat/features/messages/presentation/widgets/chat_bloc_builder.dart';
import 'package:chitchat/features/messages/presentation/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key, required this.conversationId});
  final String conversationId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          ChatBlocBuilder(),
          ChatInput(
            conversationId: conversationId,
          ),
        ],
      ),
    );
  }
}
