import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/core/helper/show_toast.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendEmailBlocListener extends StatelessWidget {
  const ResendEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.resendVerificationEmailState !=
          current.resendVerificationEmailState,
      listener: (context, state) {
        if (state.resendVerificationEmailState == StateType.error) {
          showToast(
              context: context,
              message: state.errorMessage!,
              type: ToastType.error);
        } else if (state.resendVerificationEmailState == StateType.success) {
          showToast(
              context: context,
              message: state.resendVerificationEmailResponse!.message,
              type: ToastType.success);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
