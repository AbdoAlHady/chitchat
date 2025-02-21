import 'package:chitchat/core/routing/routes.dart';
import 'package:chitchat/core/utils/extensions.dart';
import 'package:chitchat/core/widgets/app_text_button.dart';
import 'package:chitchat/core/widgets/app_text_form_field.dart';
import 'package:chitchat/core/widgets/password_text_form.dart';
import 'package:chitchat/features/auth/ui/widgets/have_or_dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: _formKey,
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
              controller: _emailController,
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
              passwordController: _passwordController,
            ),
            SizedBox(height: 20.h),
            AppTextButton(
              text: 'login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
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
