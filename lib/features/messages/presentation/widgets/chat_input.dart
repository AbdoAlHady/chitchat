import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/messages/logic/messages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, required this.conversationId});
  final String conversationId;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
        color: AppColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
            onTap: () {},
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.send,
              color: Colors.grey,
            ),
            onTap: () {
              if (_controller.text.isNotEmpty) {
                // send message
                context.read<MessagesBloc>().add(
                      SendMessageEvent(
                        conversationId: widget.conversationId,
                        content: _controller.text,
                      ),
                    );
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
