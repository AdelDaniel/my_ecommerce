import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc({required IAuthFacade authFacade})
      : _authFacade = authFacade,
        super(AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final Option<SignedInUser> userOption =
          await _authFacade.getSignedInUser();
      log("isSome ${userOption.isSome()}");
      emit(
        AuthState(
          // if there is user then he is authenticated
          signedInUser: userOption,
          isAuthenticated: userOption.isSome(),
          isFirstTimeOpenTheApp: state.isFirstTimeOpenTheApp,
        ),
      );
    });
    on<SignOut>((event, emit) async {
      try {
        await _authFacade.signOut();
        emit(
          AuthState(
            signedInUser: none(),
            isAuthenticated: false,
            isFirstTimeOpenTheApp: state.isFirstTimeOpenTheApp,
          ),
        );
      } catch (e) {
        emit(state);
      }
    });
    on<ContinuePressed>(
      (event, emit) => emit(
        AuthState(
            signedInUser: none(),
            isAuthenticated: false,
            isFirstTimeOpenTheApp: false),
      ),
    );
    on<UpdateSingedInUser>((event, emit) => emit(
          AuthState(
              signedInUser: event.user,
              isAuthenticated: false,
              isFirstTimeOpenTheApp: false),
        ));
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    log("this is json form the saved map $json");
    return AuthState(
      signedInUser: json["signedInUser"] != null
          ? none()
          : some(SignedInUser.fromMap(
              json["signedInUser"] as Map<String, dynamic>)),
      isAuthenticated: (json["isAuthenticated"] ?? false) as bool,
      isFirstTimeOpenTheApp: (json["isFirstTimeOpenTheApp"] ?? true) as bool,
    );
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    final savedMap = {
      "signedInUser":
          state.signedInUser.fold(() => null, (user) => user.toMap()),
      "isAuthenticated": state.isAuthenticated,
      "isFirstTimeOpenTheApp": state.isFirstTimeOpenTheApp,
    };
    log("saved map for hydrated auth bloc $savedMap");
    return savedMap;
  }
}
