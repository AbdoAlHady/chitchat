import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/features/auth/data/repos/auth_repo.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:chitchat/features/auth/ui/widgets/verify_email/verify_email_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepo>()),
      child: Scaffold(
        body: VerifyEmailBody(
          email: email,
        ),
      ),
    );
  }
}
