import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/core/helper/show_toast.dart';
import 'package:chitchat/core/widgets/app_text_button.dart';
import 'package:chitchat/core/widgets/loading_widget.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.registerState == StateType.error) {
          showToast(
              context: context,
              message: state.errorMessage!,
              type: ToastType.error);
        } else if (state.registerState == StateType.success) {
          showToast(
              context: context,
              message: state.registerResponse!.message,
              type: ToastType.success);
        }
      },
      builder: (context, state) {
        return state.registerState == StateType.loading
            ? LoadingWidget()
            : _validateAndRegister(context);
      },
    );
  }

  AppTextButton _validateAndRegister(BuildContext context) {
    return AppTextButton(
      text: 'Sign up',
      onPressed: () {
        final cubit = context.read<AuthCubit>();
        if (cubit.registerFormKey.currentState!.validate()) {
          cubit.register();
        }
      },
    );
  }
}
