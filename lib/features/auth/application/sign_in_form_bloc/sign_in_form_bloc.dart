import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';

import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_logging_repository.dart';
import 'package:my_ecommerce/features/auth/domain/models/email_address.dart';
import 'package:my_ecommerce/features/auth/domain/models/name.dart';
import 'package:my_ecommerce/features/auth/domain/models/password.dart';
import 'package:my_ecommerce/features/auth/domain/models/phone_number.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_form_value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final ILoggingRepository _loggingRepository;
  final AuthBloc _authBloc;
  SignInFormBloc({
    required ILoggingRepository loggingRepository,
    required AuthBloc authBloc,
  })  : _loggingRepository = loggingRepository,
        _authBloc = authBloc,
        super(SignInFormState.initial()) {
    on<SwitchBetweenSignInAndRegister>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(""),
        emailAddress: EmailAddress(""),
        password: Password(""),
        isSubmitting: false,
        showErrorMessages: false,
        name: Name(""),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<PhoneNumberChanged>((phoneNumberChangedEvent, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(phoneNumberChangedEvent.phoneNumberChangedStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<NameChanged>((nameChangedEvent, emit) {
      emit(state.copyWith(
        name: Name(nameChangedEvent.nameStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<EmailChanged>((emailChangedEvent, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(emailChangedEvent.emailStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<PasswordChanged>((passwordChangedEvent, emit) {
      emit(state.copyWith(
        password: Password(passwordChangedEvent.passwordStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<SignInWithGooglePressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final Either<AuthFailure, SignedInUser> authFailureOrSuccess =
          await _loggingRepository.signInWithGoogle();
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(authFailureOrSuccess),
      ));
      _resetPassword();
      _addSingedInUserToAuthBloc(
          user: authFailureOrSuccess.fold((l) => none(), (user) => some(user)));
    });
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      final bool isEmailValid = state.emailAddress.isValid();
      final bool isPasswordValid = state.password.isValid();
      final bool isPhoneNumberValid = state.phoneNumber.isValid();
      final bool isNameValid = state.name.isValid();
      await _performActionOnAuthFacadeWithEmailAndPassword(
        isDataValid: isEmailValid &&
            isPasswordValid &&
            isPhoneNumberValid &&
            isNameValid,
        emit: emit,
        actionMethod: _loggingRepository.registerWithEmailAndPassword,
      );
    });
    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      final bool isEmailValid = state.emailAddress.isValid();
      final bool isPasswordValid = state.password.isValid();
      await _performActionOnAuthFacadeWithEmailAndPassword(
        isDataValid: isEmailValid && isPasswordValid,
        emit: emit,
        actionMethod: _loggingRepository.signInWithEmailAndPassword,
      );
    });
  }
  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
      {required bool isDataValid,
      required Emitter<SignInFormState> emit,
      required Future<Either<AuthFailure, SignedInUser>> Function({
        required UserFormValueObjects valueObjects,
      })
          actionMethod}) async {
    log("is data valid:  $isDataValid");
    if (isDataValid) {
      // Valid
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final Either<AuthFailure, SignedInUser> authFailureOrSuccess =
          await actionMethod(
              valueObjects: UserFormValueObjects(
                  emailAddress: state.emailAddress,
                  password: state.password,
                  phoneNumber: state.phoneNumber,
                  name: state.name));
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(authFailureOrSuccess),
      ));
      if (authFailureOrSuccess.isRight()) {
        // if the user logged in clear the password
        _resetPassword();
      }
      _addSingedInUserToAuthBloc(
          user: authFailureOrSuccess.fold((l) => none(), (user) => some(user)));
    } else {
      // Not Valid Email or password
      emit(state.copyWith(
        // show the error message only when buttons are pressed
        showErrorMessages: true,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      ));
      _addSingedInUserToAuthBloc(user: none());
    }
    log("showErrorMessages: ${state.showErrorMessages}");
  }

  // at the end of sign in or register after pressing >> it must clear the password field
  void _resetPassword() => add(const SignInFormEvent.passwordChanged(''));
  void _addSingedInUserToAuthBloc({required Option<SignedInUser> user}) =>
      _authBloc.add(const AuthEvent.authCheckRequested());
  // this will used for saving the user
  // void _addSingedInUserToAuthBloc({required Option<SignedInUser> user}) =>
  //     _authBloc.add(UpdateSingedInUser(user: user));
}
