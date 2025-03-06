import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/core/helper/show_toast.dart';
import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/cache_helper.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:chitchat/core/utils/prefs_keys.dart';
import 'package:chitchat/core/widgets/app_text_button.dart';
import 'package:chitchat/core/widgets/loading_widget.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.loginState == StateType.error) {
          if (state.isEmailVerified == false) {
            context.pushNamed(Routes.verifyEmailScreen,
                arguments: context.read<AuthCubit>().emailController.text);
          }
          showToast(
              context: context,
              message: state.errorMessage!,
              type: ToastType.error);
        } else if (state.loginState == StateType.success) {
          showToast(
              context: context,
              message: 'Login Successful',
              type: ToastType.success);
          CacheHelper.setSecuredString(
              PrefsKeys.token, state.loginResponse!.token);
          CacheHelper.setSecuredString(
              PrefsKeys.userId, state.loginResponse!.data.id);
          userId = state.loginResponse!.data.id;
          context.pushNamedAndRemoveUntil(Routes.messagesScreen,
              predicate: (Route<dynamic> route) {
            return false;
          });
        }
      },
      builder: (context, state) {
        return state.loginState == StateType.loading
            ? LoadingWidget()
            : _buildLoginButton(context);
      },
    );
  }

  AppTextButton _buildLoginButton(BuildContext context) {
    return AppTextButton(
      text: 'login',
      onPressed: () {
        final cubit = context.read<AuthCubit>();
        if (cubit.loginFormKey.currentState!.validate()) {
          cubit.login();
        }
      },
    );
  }
}
