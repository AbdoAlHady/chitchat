import 'package:chitchat/core/di/service_locator.dart';
import 'package:chitchat/features/auth/data/repos/auth_repo.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:chitchat/features/auth/ui/widgets/register/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepo>()),
      child: const Scaffold(
        body: SafeArea(child: RegisterScreenBody()),
      ),
    );
  }
}
