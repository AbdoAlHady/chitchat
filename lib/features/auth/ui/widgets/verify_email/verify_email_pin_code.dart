import 'package:chitchat/core/theme/app_colors.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailPinCode extends StatelessWidget {
  const VerifyEmailPinCode({
    super.key,
    required this.email,
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: context.read<AuthCubit>().codeController,
      length: 6,
      defaultPinTheme: _buildPinTheme(),
      focusedPinTheme: _buildPinTheme().copyWith(
        decoration: _buildPinTheme().decoration!.copyWith(
              color: AppColors.senderMessage,
            ),
      ),
      onCompleted: (pin) => {
        context.read<AuthCubit>().verifyEmail(email: email),
      },
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
