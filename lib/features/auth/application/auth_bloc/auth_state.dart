part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    required bool isFirstTimeOpenTheApp,
    required Option<SignedInUser> signedInUser,
  }) = _AuthState;

  // the initial state with its data
  factory AuthState.initial() => AuthState(
        isAuthenticated: false,
        isFirstTimeOpenTheApp: true,
        signedInUser: none(),
      );

  // const factory AuthState.initial({
  //   @Default("Initial") String stateName,
  // }) = Initial;
  // const factory AuthState.authenticated({
  //   @Default("Authenticated") String stateName,
  // }) = Authenticated;
  // const factory AuthState.notAuthenticated({
  //   @Default("NotAuthenticated") String stateName,
  // }) = NotAuthenticated;

}
