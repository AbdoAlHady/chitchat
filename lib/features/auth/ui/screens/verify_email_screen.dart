import 'package:chitchat/features/auth/ui/widgets/verify_email/verify_email_body.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const VerifyEmailBody(),
    );
  }
}
