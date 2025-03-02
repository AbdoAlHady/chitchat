import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentContactsItem extends StatelessWidget {
  const RecentContactsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5.h,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/19399100/pexels-photo-19399100/free-photo-of-palestinian.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          ),
          Text(
            'Abd',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
