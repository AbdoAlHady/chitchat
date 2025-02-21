import 'package:chitchat/core/widgets/app_text_form_field.dart';
import 'package:chitchat/core/widgets/password_text_form.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/ui/widgets/have_or_dont_have_account.dart';
import 'package:chitchat/features/auth/ui/widgets/register/register_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: context.read<AuthCubit>().registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Sign up now and start chatting!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 30.h),
            AppTextFormField(
              controller: context.read<AuthCubit>().usernameController,
              hintText: "Username",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'This field is required'),
                FormBuilderValidators.minLength(6,
                    errorText: 'Username must be at least 6 characters long'),
              ]),
              prefixIcon: Icon(Icons.person),
            ),
            SizedBox(height: 10.h),
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
            RegisterBlocConsumer(),
            SizedBox(height: 10.h),
            Center(
              child: HaveOrDontHaveAccount(
                  text1: 'Already have an account? ',
                  text2: " Login",
                  onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
