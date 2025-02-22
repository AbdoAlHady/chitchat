import 'package:chitchat/core/helper/helper_functions.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/resend_code.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/resend_email_bloc_listener.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/verify_email_bloc_consumer.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/verify_email_pin_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Email Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Enter 6-digits code we sent you\n on your email address',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              Text(
                maskEmail(email: email),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              VerifyEmailPinCode(email: email),
              ResendCode(email: email),
              VerifyEmailBlocConsumer(),
              ResendEmailBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
