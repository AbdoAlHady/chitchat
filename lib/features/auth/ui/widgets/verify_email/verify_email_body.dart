import 'package:chitchat/core/helper/helper_functions.dart';
import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Email Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Enter 6-digits code we sent you\n on your email address',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                maskEmail(email: 'Abdo.agiry@gmail.com'),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              VerifyEmailPinCode(),
              const SizedBox(height: 20),
              ResendCode(),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyEmailPinCode extends StatelessWidget {
  const VerifyEmailPinCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: _buildPinTheme(),
      focusedPinTheme: _buildPinTheme().copyWith(
        decoration: _buildPinTheme().decoration!.copyWith(
              color: AppColors.senderMessage,
            ),
      ),
      onCompleted: (pin) => {},
    );
  }

  PinTheme _buildPinTheme() {
    return PinTheme(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteText),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.sentMessageInput),
    );
  }
}
