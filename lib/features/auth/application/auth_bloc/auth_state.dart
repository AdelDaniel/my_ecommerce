part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    required bool isFirstTimeOpenTheApp,
  }) = _AuthState;

  // the initial state with its data
  factory AuthState.initial() => const AuthState(
        isFirstTimeOpenTheApp: true,
        isAuthenticated: false,
      );
}
