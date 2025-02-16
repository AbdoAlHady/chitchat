import 'package:chitchat/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextFrom extends StatefulWidget {
  const PasswordTextFrom({
    super.key,
    required this.passwordController,
  });
  final TextEditingController passwordController;

  @override
  State<PasswordTextFrom> createState() => _PasswordTextFromState();
}

class _PasswordTextFromState extends State<PasswordTextFrom> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.passwordController,
      hintText: "Password",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'This field is required'),
        FormBuilderValidators.password(
            minNumberCount: 8,
            errorText:
                'Password must contain at least 1 uppercase,\n1 lowercase, 8 number and 1 special character'),
      ]),
      isObscureText: isPassword,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          icon: Icon(isPassword ? Icons.visibility_off : Icons.visibility)),
    );
  }
}
