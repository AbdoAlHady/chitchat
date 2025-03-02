import 'package:chitchat/features/conversations/presentations/widgets/recent_contacts_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentContactsListViewItem extends StatelessWidget {
  const RecentContactsListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RecentContactsItem(),
          RecentContactsItem(),
          RecentContactsItem(),
          RecentContactsItem(),
          RecentContactsItem(),
        ],
      ),
    );
  }
}
