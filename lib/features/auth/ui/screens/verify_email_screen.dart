import 'package:chitchat/features/auth/ui/widgets/verify_email/verify_email_body.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const VerifyEmailBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        // centerTitle: true,
        // title:
        //     Text('Verify Email', style: Theme.of(context).textTheme.titleLarge),
        );
  }
}
