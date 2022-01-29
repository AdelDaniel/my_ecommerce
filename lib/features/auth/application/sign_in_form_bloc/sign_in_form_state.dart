part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  // not union just a factory constructor
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required Name name,
    required PhoneNumber phoneNumber,
    // to show the error after the user type and not after he press signIn or signUp
    required bool showErrorMessages,
    // this is used to show the progressIndicator
    required bool isSubmitting,
    // with option you have >> some() && none()
    // Option<none,some> .. none: no value is present and some: some value is valid in the option
    required Option<Either<AuthFailure, SignedInUser>>
        authFailureOrSuccessOption,
  }) = _SignInFormState;

  /// the initial state with its data
  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        name: Name(''),
        phoneNumber: PhoneNumber(''),
        showErrorMessages: false,
        isSubmitting: false,
        // initially no response >> so not AuthFailure or Unit >> null is suck
        // so i used Option and it take none() instead of null
        authFailureOrSuccessOption: none(),
      );
}
