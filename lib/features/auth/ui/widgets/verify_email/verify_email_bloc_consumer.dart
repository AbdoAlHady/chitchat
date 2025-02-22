import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/core/helper/show_toast.dart';
import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:chitchat/core/widgets/loading_widget.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailBlocConsumer extends StatelessWidget {
  const VerifyEmailBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.verifyEmailState == StateType.success) {
          showToast(
              context: context,
              message: state.verifyEmailResponse!.message,
              type: ToastType.success);
          context.pushNamedAndRemoveUntil(Routes.loginScreen,
              predicate: (_) => false);
        } else if (state.verifyEmailState == StateType.error) {
          showToast(
              context: context,
              message: state.errorMessage!,
              type: ToastType.error);
        }
      },
      builder: (context, state) {
        return state.verifyEmailState == StateType.loading
            ? LoadingWidget()
            : const SizedBox.shrink();
      },
    );
  }
}
