// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  AuthCheckRequested authCheckRequested() {
    return const AuthCheckRequested();
  }

  SignOut signOut() {
    return const SignOut();
  }

  ContinuePressed continuePressed() {
    return const ContinuePressed();
  }

  UpdateSingedInUser updateSingedInUser({required Option<SignedInUser> user}) {
    return UpdateSingedInUser(
      user: user,
    );
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCheckRequested,
    required TResult Function() signOut,
    required TResult Function() continuePressed,
    required TResult Function(Option<SignedInUser> user) updateSingedInUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) authCheckRequested,
    required TResult Function(SignOut value) signOut,
    required TResult Function(ContinuePressed value) continuePressed,
    required TResult Function(UpdateSingedInUser value) updateSingedInUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthCheckRequestedCopyWith<$Res> {
  factory $AuthCheckRequestedCopyWith(
          AuthCheckRequested value, $Res Function(AuthCheckRequested) then) =
      _$AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckRequestedCopyWith<$Res> {
  _$AuthCheckRequestedCopyWithImpl(
      AuthCheckRequested _value, $Res Function(AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthCheckRequested));

  @override
  AuthCheckRequested get _value => super._value as AuthCheckRequested;
}

/// @nodoc

class _$AuthCheckRequested implements AuthCheckRequested {
  const _$AuthCheckRequested();

  @override
  String toString() {
    return 'AuthEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCheckRequested,
    required TResult Function() signOut,
    required TResult Function() continuePressed,
    required TResult Function(Option<SignedInUser> user) updateSingedInUser,
  }) {
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
  }) {
    return authCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) authCheckRequested,
    required TResult Function(SignOut value) signOut,
    required TResult Function(ContinuePressed value) continuePressed,
    required TResult Function(UpdateSingedInUser value) updateSingedInUser,
  }) {
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
  }) {
    return authCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequested;
}

/// @nodoc
abstract class $SignOutCopyWith<$Res> {
  factory $SignOutCopyWith(SignOut value, $Res Function(SignOut) then) =
      _$SignOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $SignOutCopyWith<$Res> {
  _$SignOutCopyWithImpl(SignOut _value, $Res Function(SignOut) _then)
      : super(_value, (v) => _then(v as SignOut));

  @override
  SignOut get _value => super._value as SignOut;
}

/// @nodoc

class _$SignOut implements SignOut {
  const _$SignOut();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCheckRequested,
    required TResult Function() signOut,
    required TResult Function() continuePressed,
    required TResult Function(Option<SignedInUser> user) updateSingedInUser,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) authCheckRequested,
    required TResult Function(SignOut value) signOut,
    required TResult Function(ContinuePressed value) continuePressed,
    required TResult Function(UpdateSingedInUser value) updateSingedInUser,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class SignOut implements AuthEvent {
  const factory SignOut() = _$SignOut;
}

/// @nodoc
abstract class $ContinuePressedCopyWith<$Res> {
  factory $ContinuePressedCopyWith(
          ContinuePressed value, $Res Function(ContinuePressed) then) =
      _$ContinuePressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ContinuePressedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $ContinuePressedCopyWith<$Res> {
  _$ContinuePressedCopyWithImpl(
      ContinuePressed _value, $Res Function(ContinuePressed) _then)
      : super(_value, (v) => _then(v as ContinuePressed));

  @override
  ContinuePressed get _value => super._value as ContinuePressed;
}

/// @nodoc

class _$ContinuePressed implements ContinuePressed {
  const _$ContinuePressed();

  @override
  String toString() {
    return 'AuthEvent.continuePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ContinuePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCheckRequested,
    required TResult Function() signOut,
    required TResult Function() continuePressed,
    required TResult Function(Option<SignedInUser> user) updateSingedInUser,
  }) {
    return continuePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
  }) {
    return continuePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (continuePressed != null) {
      return continuePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) authCheckRequested,
    required TResult Function(SignOut value) signOut,
    required TResult Function(ContinuePressed value) continuePressed,
    required TResult Function(UpdateSingedInUser value) updateSingedInUser,
  }) {
    return continuePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
  }) {
    return continuePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (continuePressed != null) {
      return continuePressed(this);
    }
    return orElse();
  }
}

abstract class ContinuePressed implements AuthEvent {
  const factory ContinuePressed() = _$ContinuePressed;
}

/// @nodoc
abstract class $UpdateSingedInUserCopyWith<$Res> {
  factory $UpdateSingedInUserCopyWith(
          UpdateSingedInUser value, $Res Function(UpdateSingedInUser) then) =
      _$UpdateSingedInUserCopyWithImpl<$Res>;
  $Res call({Option<SignedInUser> user});
}

/// @nodoc
class _$UpdateSingedInUserCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $UpdateSingedInUserCopyWith<$Res> {
  _$UpdateSingedInUserCopyWithImpl(
      UpdateSingedInUser _value, $Res Function(UpdateSingedInUser) _then)
      : super(_value, (v) => _then(v as UpdateSingedInUser));

  @override
  UpdateSingedInUser get _value => super._value as UpdateSingedInUser;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UpdateSingedInUser(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Option<SignedInUser>,
    ));
  }
}

/// @nodoc

class _$UpdateSingedInUser implements UpdateSingedInUser {
  const _$UpdateSingedInUser({required this.user});

  @override
  final Option<SignedInUser> user;

  @override
  String toString() {
    return 'AuthEvent.updateSingedInUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateSingedInUser &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $UpdateSingedInUserCopyWith<UpdateSingedInUser> get copyWith =>
      _$UpdateSingedInUserCopyWithImpl<UpdateSingedInUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCheckRequested,
    required TResult Function() signOut,
    required TResult Function() continuePressed,
    required TResult Function(Option<SignedInUser> user) updateSingedInUser,
  }) {
    return updateSingedInUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
  }) {
    return updateSingedInUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCheckRequested,
    TResult Function()? signOut,
    TResult Function()? continuePressed,
    TResult Function(Option<SignedInUser> user)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (updateSingedInUser != null) {
      return updateSingedInUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) authCheckRequested,
    required TResult Function(SignOut value) signOut,
    required TResult Function(ContinuePressed value) continuePressed,
    required TResult Function(UpdateSingedInUser value) updateSingedInUser,
  }) {
    return updateSingedInUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
  }) {
    return updateSingedInUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? authCheckRequested,
    TResult Function(SignOut value)? signOut,
    TResult Function(ContinuePressed value)? continuePressed,
    TResult Function(UpdateSingedInUser value)? updateSingedInUser,
    required TResult orElse(),
  }) {
    if (updateSingedInUser != null) {
      return updateSingedInUser(this);
    }
    return orElse();
  }
}

abstract class UpdateSingedInUser implements AuthEvent {
  const factory UpdateSingedInUser({required Option<SignedInUser> user}) =
      _$UpdateSingedInUser;

  Option<SignedInUser> get user;
  @JsonKey(ignore: true)
  $UpdateSingedInUserCopyWith<UpdateSingedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {required bool isAuthenticated,
      required bool isFirstTimeOpenTheApp,
      required Option<SignedInUser> signedInUser}) {
    return _AuthState(
      isAuthenticated: isAuthenticated,
      isFirstTimeOpenTheApp: isFirstTimeOpenTheApp,
      signedInUser: signedInUser,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get isFirstTimeOpenTheApp => throw _privateConstructorUsedError;
  Option<SignedInUser> get signedInUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isAuthenticated,
      bool isFirstTimeOpenTheApp,
      Option<SignedInUser> signedInUser});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isAuthenticated = freezed,
    Object? isFirstTimeOpenTheApp = freezed,
    Object? signedInUser = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstTimeOpenTheApp: isFirstTimeOpenTheApp == freezed
          ? _value.isFirstTimeOpenTheApp
          : isFirstTimeOpenTheApp // ignore: cast_nullable_to_non_nullable
              as bool,
      signedInUser: signedInUser == freezed
          ? _value.signedInUser
          : signedInUser // ignore: cast_nullable_to_non_nullable
              as Option<SignedInUser>,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isAuthenticated,
      bool isFirstTimeOpenTheApp,
      Option<SignedInUser> signedInUser});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? isAuthenticated = freezed,
    Object? isFirstTimeOpenTheApp = freezed,
    Object? signedInUser = freezed,
  }) {
    return _then(_AuthState(
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstTimeOpenTheApp: isFirstTimeOpenTheApp == freezed
          ? _value.isFirstTimeOpenTheApp
          : isFirstTimeOpenTheApp // ignore: cast_nullable_to_non_nullable
              as bool,
      signedInUser: signedInUser == freezed
          ? _value.signedInUser
          : signedInUser // ignore: cast_nullable_to_non_nullable
              as Option<SignedInUser>,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.isAuthenticated,
      required this.isFirstTimeOpenTheApp,
      required this.signedInUser});

  @override
  final bool isAuthenticated;
  @override
  final bool isFirstTimeOpenTheApp;
  @override
  final Option<SignedInUser> signedInUser;

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated, isFirstTimeOpenTheApp: $isFirstTimeOpenTheApp, signedInUser: $signedInUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality()
                .equals(other.isFirstTimeOpenTheApp, isFirstTimeOpenTheApp) &&
            const DeepCollectionEquality()
                .equals(other.signedInUser, signedInUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAuthenticated),
      const DeepCollectionEquality().hash(isFirstTimeOpenTheApp),
      const DeepCollectionEquality().hash(signedInUser));

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required bool isAuthenticated,
      required bool isFirstTimeOpenTheApp,
      required Option<SignedInUser> signedInUser}) = _$_AuthState;

  @override
  bool get isAuthenticated;
  @override
  bool get isFirstTimeOpenTheApp;
  @override
  Option<SignedInUser> get signedInUser;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
