import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/features/messages/data/repo/messages_repo.dart';
import 'package:chitchat/features/messages/logic/messages_bloc.dart';
import 'package:chitchat/features/messages/presentation/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  final String conversationId;
  const ChatScreen({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessagesBloc(sl<MessagesRepo>())
        ..add(GetAllMessagesEvent(conversationId: conversationId)),
      child: Scaffold(
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
        body: ChatScreenBody(
          conversationId: conversationId,
        ),
      ),
    );
  }
}
