import 'package:chitchat/features/messages/presentations/widgets/message_tile.dart';
import 'package:chitchat/features/messages/presentations/widgets/messages_list_view_item.dart';
import 'package:chitchat/features/messages/presentations/widgets/recent_contacts_item.dart';
import 'package:chitchat/features/messages/presentations/widgets/recent_contacts_list_view_iem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesScreenBody extends StatelessWidget {
  const MessagesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Recent Contacts
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'Recent Contacts',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        RecentContactsListViewItem(),
        // Messages
        MessagesListViewItem(),
      ],
    );
  }
}
