import 'package:chitchat/features/messages/presentation/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/19399100/pexels-photo-19399100/free-photo-of-palestinian.jpeg'),
            ),
            SizedBox(width: 10.w),
            Text(
              'Abdo Al hady',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ChatScreenBody(),
    );
  }
}
