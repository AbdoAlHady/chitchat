import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:chitchat/core/widgets/app_text_form_field.dart';
import 'package:chitchat/core/widgets/password_text_form.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/ui/widgets/have_or_dont_have_account.dart';
import 'package:chitchat/features/auth/ui/widgets/login/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: context.read<AuthCubit>().loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Welcome back! \n Enter your details below and start chatting instantly!',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 30.h),
            AppTextFormField(
              controller: context.read<AuthCubit>().emailController,
              hintText: "Email",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'This field is required'),
                FormBuilderValidators.email(
                    errorText: 'Please enter a valid email address'),
              ]),
              prefixIcon: Icon(Icons.email),
            ),
            SizedBox(height: 10.h),
            PasswordTextFrom(
              passwordController: context.read<AuthCubit>().passwordController,
            ),
            SizedBox(height: 20.h),
            LoginButton(),
            SizedBox(height: 10.h),
            Center(
              child: HaveOrDontHaveAccount(
                  text1: "Don't have an account?",
                  text2: " Register",
                  onTap: () {
                    context.pushReplacementNamed(Routes.registerScreen);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
