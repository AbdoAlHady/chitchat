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

  const AuthState(
      {this.registerState = StateType.initial,
      this.errorMessage = "",
      this.email,
      this.verifyEmailResponse,
      this.verifyEmailState = StateType.initial,
      this.registerResponse});

  @override
  List<Object?> get props => [registerState, errorMessage, registerResponse];

  AuthState copyWith({
    StateType? registerState,
    String? errorMessage,
    StateType? verifyEmailState,
    String? email,
    MessageResponse? verifyEmailResponse,
    MessageResponse? registerResponse,
  }) {
    return AuthState(
      registerState: registerState ?? registerState,
      errorMessage: errorMessage ?? this.errorMessage,
      registerResponse: registerResponse ?? this.registerResponse,
      verifyEmailState: verifyEmailState ?? this.verifyEmailState,
      verifyEmailResponse: verifyEmailResponse ?? this.verifyEmailResponse,
      email: email ?? this.email,
    );
  }
}
