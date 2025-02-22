import 'package:chitchat/features/auth/data/models/message_response.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/state_type.dart';

class AuthState extends Equatable {
  final StateType? registerState;
  final String? errorMessage;
  final MessageResponse? registerResponse;
  final StateType? verifyEmailState;
  final MessageResponse? verifyEmailResponse;

  const AuthState(
      {this.registerState = StateType.initial,
      this.errorMessage = "",
      this.verifyEmailResponse,
      this.verifyEmailState = StateType.initial,
      this.registerResponse});

  @override
  List<Object?> get props => [registerState, errorMessage, registerResponse];

  AuthState copyWith({
    StateType? registerState,
    String? errorMessage,
    StateType? verifyEmailState,
    MessageResponse? verifyEmailResponse,
    MessageResponse? registerResponse,
  }) {
    return AuthState(
      registerState: registerState ?? registerState,
      errorMessage: errorMessage ?? this.errorMessage,
      registerResponse: registerResponse ?? this.registerResponse,
      verifyEmailState: verifyEmailState ?? this.verifyEmailState,
      verifyEmailResponse: verifyEmailResponse ?? this.verifyEmailResponse,
    );
  }
}
