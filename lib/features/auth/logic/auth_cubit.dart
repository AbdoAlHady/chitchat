import 'package:chitchat/features/auth/data/models/register_response.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/state_type.dart';

class AuthState extends Equatable {
  final StateType? registerState;
  final String? errorMessage;
  final String? email;
  final RegisterResponse? registerResponse;

  const AuthState(
      {this.registerState = StateType.initial,
      this.errorMessage = "",
      this.email = "",
      this.registerResponse});

  @override
  List<Object?> get props =>
      [registerState, errorMessage, email, registerResponse];

  AuthState copyWith({
    StateType? registerState,
    String? errorMessage,
    String? email,
    RegisterResponse? registerResponse,
  }) {
    return AuthState(
      registerState: registerState ?? registerState,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      registerResponse: registerResponse ?? this.registerResponse,
    );
  }
}
