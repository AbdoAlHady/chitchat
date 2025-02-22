import 'dart:developer';

import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/features/auth/data/models/login_request_body.dart';
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
  final loginFormKey = GlobalKey<FormState>();

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
          email: emailController.text.trim(),
          errorMessage: null)),
    );
  }

  // Login With Email and Password
  void login() async {
    emit(state.copyWith(loginState: StateType.loading));
    final result = await _repo.login(LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
    result.fold(
      (failure) {
        log(failure.code.toString());
        emit(state.copyWith(
            loginState: StateType.error,
            errorMessage: failure.message,
            isEmailVerified: failure.code == 403 ? false : true,
            loginResponse: null));
      },
      (response) => emit(state.copyWith(
          loginState: StateType.success,
          loginResponse: response,
          isEmailVerified: true,
          errorMessage: null)),
    );
  }

  // Verify the email
  void verifyEmail({required String email}) async {
    emit(state.copyWith(
      verifyEmailState: StateType.loading,
      errorMessage: null,
      verifyEmailResponse: null,
      email: email, // Add this to ensure email is preserved in state
    ));
    log(email);
    final result = await _repo.verifyEmail(
        VerifyEmailRequestBody(email: email, code: codeController.text.trim()));
    result.fold(
      (failure) => emit(state.copyWith(
        verifyEmailState: StateType.error,
        errorMessage: failure.message,
        email: email, // Preserve email in error state
      )),
      (response) => emit(state.copyWith(
        verifyEmailState: StateType.success,
        verifyEmailResponse: response,
        errorMessage: null,
        email: email, // Preserve email in success state
      )),
    );
  }

  // Resend verification email
  void resendVerificationEmail({required String email}) async {
    emit(state.copyWith(
        resendVerificationEmailState: StateType.loading,
        errorMessage: null,
        resendVerificationEmailResponse: null));
    final result = await _repo.resendVerificationEmail(email);
    result.fold(
      (failure) => emit(state.copyWith(
          resendVerificationEmailState: StateType.error,
          errorMessage: failure.message,
          resendVerificationEmailResponse: null)),
      (response) => emit(state.copyWith(
          resendVerificationEmailState: StateType.success,
          resendVerificationEmailResponse: response,
          errorMessage: null)),
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    codeController.dispose();
    return super.close();
  }
}
