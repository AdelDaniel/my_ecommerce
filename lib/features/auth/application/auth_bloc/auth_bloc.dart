import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_logging_repository.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final ILoggingRepository _loggingRepository;
  AuthBloc({required ILoggingRepository loggingRepository})
      : _loggingRepository = loggingRepository,
        super(AuthState.initial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignOut>(_onSignOut);
    on<ContinuePressed>(_onContinuePressed);
  }

  Future<void> _onAuthCheckRequested(event, Emitter emit) async {
    final Option<SignedInUser> userOption =
        await _loggingRepository.getSignedInUser();
    // if there is user then he is authenticated
    emit(
      AuthState(
        isAuthenticated: userOption.isSome(),
        isFirstTimeOpenTheApp: state.isFirstTimeOpenTheApp,
      ),
    );
  }

  Future<void> _onSignOut(event, Emitter emit) async {
    try {
      await _loggingRepository.signOut();
      emit(const AuthState(
          isAuthenticated: false, isFirstTimeOpenTheApp: false));
    } catch (e) {
      emit(state);
    }
  }

  Future<void> _onContinuePressed(event, Emitter emit) async {
    emit(const AuthState(isAuthenticated: false, isFirstTimeOpenTheApp: false));
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    return AuthState(
      isAuthenticated: (json["isAuthenticated"] ?? false) as bool,
      isFirstTimeOpenTheApp: (json["isFirstTimeOpenTheApp"] ?? true) as bool,
    );
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    return {
      "isAuthenticated": state.isAuthenticated,
      "isFirstTimeOpenTheApp": state.isFirstTimeOpenTheApp,
    };
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log("on Change  currentState::${change.currentState}  nextState::${change.nextState}");
  }
}
