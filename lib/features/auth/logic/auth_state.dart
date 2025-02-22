import 'package:chitchat/features/auth/data/models/message_response.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/state_type.dart';

class AuthState extends Equatable {
  final StateType? registerState;
  final String? errorMessage;
  final MessageResponse? registerResponse;
  final StateType? verifyEmailState;
  final String? email;
  final MessageResponse? verifyEmailResponse;
  final MessageResponse? resendVerificationEmailResponse;
  final StateType? resendVerificationEmailState;

  const AuthState(
      {this.registerState = StateType.initial,
      this.errorMessage = "",
      this.email,
      this.resendVerificationEmailResponse,
      this.resendVerificationEmailState = StateType.initial,
      this.verifyEmailResponse,
      this.verifyEmailState = StateType.initial,
      this.registerResponse});

  @override
  List<Object?> get props => [
        registerState,
        errorMessage,
        registerResponse,
        verifyEmailState,
        email,
        verifyEmailResponse,
        resendVerificationEmailResponse,
        resendVerificationEmailState
      ];

  AuthState copyWith({
    StateType? registerState,
    String? errorMessage,
    StateType? verifyEmailState,
    String? email,
    StateType? resendVerificationEmailState,
    MessageResponse? resendVerificationEmailResponse,
    MessageResponse? verifyEmailResponse,
    MessageResponse? registerResponse,
  }) {
    return AuthState(
      registerState: registerState ?? this.registerState, // Fixed this line
      errorMessage: errorMessage ?? this.errorMessage,
      registerResponse: registerResponse ?? this.registerResponse,
      verifyEmailState: verifyEmailState ?? this.verifyEmailState,
      verifyEmailResponse: verifyEmailResponse ?? this.verifyEmailResponse,
      email: email ?? this.email,
      resendVerificationEmailResponse: resendVerificationEmailResponse ??
          this.resendVerificationEmailResponse,
      resendVerificationEmailState:
          resendVerificationEmailState ?? this.resendVerificationEmailState,
    );
  }
}
