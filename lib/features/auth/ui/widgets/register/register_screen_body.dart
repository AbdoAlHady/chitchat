import 'package:chitchat/core/widgets/app_text_button.dart';
import 'package:chitchat/core/widgets/app_text_form_field.dart';
import 'package:chitchat/core/widgets/password_text_form.dart';
import 'package:chitchat/features/auth/ui/widgets/have_or_dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
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
              'Sign up now and start chatting!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 30.h),
            AppTextFormField(
              controller: _usernameController,
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
            // RegisterBlocConsumer(formKey: _formKey),
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

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      text: 'Sign up',
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
    );
  }
}
