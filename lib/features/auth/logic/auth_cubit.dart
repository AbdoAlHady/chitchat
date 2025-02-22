import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/verify_email_request_body.dart';
import 'package:chitchat/features/auth/data/repos/auth_repo.dart';
import 'package:chitchat/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo) : super(AuthState());
  final AuthRepo _repo;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final verifyEmailFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  // Register the user
  void register() async {
    emit(state.copyWith(registerState: StateType.loading));
    final result = await _repo.register(RegisterRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        userName: usernameController.text.trim().toString()));
    result.fold(
      (failure) => emit(state.copyWith(
          registerState: StateType.error,
          errorMessage: failure.message,
          registerResponse: null)),
      (response) => emit(state.copyWith(
          registerState: StateType.success,
          registerResponse: response,
          errorMessage: null)),
    );
  }

  // Verify the email
  void verifyEmail() async {
    emit(state.copyWith(verifyEmailState: StateType.loading));
    final result = await _repo.verifyEmail(VerifyEmailRequestBody(
        email: emailController.text.trim(), code: codeController.text.trim()));
    result.fold(
      (failure) => emit(state.copyWith(
          verifyEmailState: StateType.error,
          errorMessage: failure.message,
          verifyEmailResponse: null)),
      (response) => emit(state.copyWith(
          verifyEmailState: StateType.success,
          verifyEmailResponse: response,
          errorMessage: null)),
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
