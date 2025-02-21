import 'package:chitchat/core/enums/state_type.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/repos/auth_repo.dart';
import 'package:chitchat/features/auth/logic/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo) : super(AuthState());
  final AuthRepo _repo;

  // Register the user
  void register(RegisterRequestBody registerRequestBody) async {
    emit(state.copyWith(registerState: StateType.loading));

    final result = await _repo.register(registerRequestBody);
    result.fold(
      (failure) => emit(state.copyWith(
          registerState: StateType.error, errorMessage: failure.message)),
      (response) => emit(state.copyWith(
          registerState: StateType.success, registerResponse: response)),
    );
  }
}
