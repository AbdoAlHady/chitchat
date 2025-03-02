import 'package:chitchat/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.receiverMessage,
          borderRadius: _buildBorder(),
        ),
        child: Text("Hello World from Chat Item"),
      ),
    );
  }

  BorderRadius _buildBorder() {
    return BorderRadius.only(
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );
  }
}
