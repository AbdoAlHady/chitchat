import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key});

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
        'Abdo',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Hello there how are you?',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey),
        maxLines: 1,
      ),
      trailing: Text(
        '12:00 PM',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
