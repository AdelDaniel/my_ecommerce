// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invalidEmail<T>(
      {String failMsg = "Invalid Email!", required T failedValue}) {
    return InvalidEmail<T>(
      failMsg: failMsg,
      failedValue: failedValue,
    );
  }

  ShortPassword<T> shortPassword<T>(
      {String failMsg = "Short Password < at least 6 characters!",
      required T failedValue}) {
    return ShortPassword<T>(
      failMsg: failMsg,
      failedValue: failedValue,
    );
  }

  EmptyField<T> emptyField<T>(
      {String failMsg = "Must Not Empty!", required T failedValue}) {
    return EmptyField<T>(
      failMsg: failMsg,
      failedValue: failedValue,
    );
  }

  InvalidPhoneNumber<T> invalidPhoneNumber<T>(
      {String failMsg = "Invalid Phone Number!", required T failedValue}) {
    return InvalidPhoneNumber<T>(
      failMsg: failMsg,
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  String get failMsg => throw _privateConstructorUsedError;
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failMsg, T failedValue) invalidEmail,
    required TResult Function(String failMsg, T failedValue) shortPassword,
    required TResult Function(String failMsg, T failedValue) emptyField,
    required TResult Function(String failMsg, T failedValue) invalidPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failMsg, T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failMsg = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failMsg: failMsg == freezed
          ? _value.failMsg
          : failMsg // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({String failMsg, T failedValue});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object? failMsg = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failMsg: failMsg == freezed
          ? _value.failMsg
          : failMsg // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T>
    with DiagnosticableTreeMixin
    implements InvalidEmail<T> {
  const _$InvalidEmail(
      {this.failMsg = "Invalid Email!", required this.failedValue});

  @JsonKey()
  @override
  final String failMsg;
  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidEmail(failMsg: $failMsg, failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidEmail'))
      ..add(DiagnosticsProperty('failMsg', failMsg))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmail<T> &&
            const DeepCollectionEquality().equals(other.failMsg, failMsg) &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failMsg),
      const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failMsg, T failedValue) invalidEmail,
    required TResult Function(String failMsg, T failedValue) shortPassword,
    required TResult Function(String failMsg, T failedValue) emptyField,
    required TResult Function(String failMsg, T failedValue) invalidPhoneNumber,
  }) {
    return invalidEmail(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
  }) {
    return invalidEmail?.call(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failMsg, failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({String failMsg, required T failedValue}) =
      _$InvalidEmail<T>;

  @override
  String get failMsg;
  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword<T> value, $Res Function(ShortPassword<T>) then) =
      _$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({String failMsg, T failedValue});
}

/// @nodoc
class _$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword<T> _value, $Res Function(ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as ShortPassword<T>));

  @override
  ShortPassword<T> get _value => super._value as ShortPassword<T>;

  @override
  $Res call({
    Object? failMsg = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(ShortPassword<T>(
      failMsg: failMsg == freezed
          ? _value.failMsg
          : failMsg // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T>
    with DiagnosticableTreeMixin
    implements ShortPassword<T> {
  const _$ShortPassword(
      {this.failMsg = "Short Password < at least 6 characters!",
      required this.failedValue});

  @JsonKey()
  @override
  final String failMsg;
  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.shortPassword(failMsg: $failMsg, failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.shortPassword'))
      ..add(DiagnosticsProperty('failMsg', failMsg))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShortPassword<T> &&
            const DeepCollectionEquality().equals(other.failMsg, failMsg) &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failMsg),
      const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failMsg, T failedValue) invalidEmail,
    required TResult Function(String failMsg, T failedValue) shortPassword,
    required TResult Function(String failMsg, T failedValue) emptyField,
    required TResult Function(String failMsg, T failedValue) invalidPhoneNumber,
  }) {
    return shortPassword(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
  }) {
    return shortPassword?.call(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failMsg, failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({String failMsg, required T failedValue}) =
      _$ShortPassword<T>;

  @override
  String get failMsg;
  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyFieldCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyFieldCopyWith(
          EmptyField<T> value, $Res Function(EmptyField<T>) then) =
      _$EmptyFieldCopyWithImpl<T, $Res>;
  @override
  $Res call({String failMsg, T failedValue});
}

/// @nodoc
class _$EmptyFieldCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyFieldCopyWith<T, $Res> {
  _$EmptyFieldCopyWithImpl(
      EmptyField<T> _value, $Res Function(EmptyField<T>) _then)
      : super(_value, (v) => _then(v as EmptyField<T>));

  @override
  EmptyField<T> get _value => super._value as EmptyField<T>;

  @override
  $Res call({
    Object? failMsg = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(EmptyField<T>(
      failMsg: failMsg == freezed
          ? _value.failMsg
          : failMsg // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmptyField<T> with DiagnosticableTreeMixin implements EmptyField<T> {
  const _$EmptyField(
      {this.failMsg = "Must Not Empty!", required this.failedValue});

  @JsonKey()
  @override
  final String failMsg;
  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.emptyField(failMsg: $failMsg, failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.emptyField'))
      ..add(DiagnosticsProperty('failMsg', failMsg))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmptyField<T> &&
            const DeepCollectionEquality().equals(other.failMsg, failMsg) &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failMsg),
      const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $EmptyFieldCopyWith<T, EmptyField<T>> get copyWith =>
      _$EmptyFieldCopyWithImpl<T, EmptyField<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failMsg, T failedValue) invalidEmail,
    required TResult Function(String failMsg, T failedValue) shortPassword,
    required TResult Function(String failMsg, T failedValue) emptyField,
    required TResult Function(String failMsg, T failedValue) invalidPhoneNumber,
  }) {
    return emptyField(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
  }) {
    return emptyField?.call(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (emptyField != null) {
      return emptyField(failMsg, failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
  }) {
    return emptyField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
  }) {
    return emptyField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (emptyField != null) {
      return emptyField(this);
    }
    return orElse();
  }
}

abstract class EmptyField<T> implements ValueFailure<T> {
  const factory EmptyField({String failMsg, required T failedValue}) =
      _$EmptyField<T>;

  @override
  String get failMsg;
  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $EmptyFieldCopyWith<T, EmptyField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidPhoneNumberCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidPhoneNumberCopyWith(InvalidPhoneNumber<T> value,
          $Res Function(InvalidPhoneNumber<T>) then) =
      _$InvalidPhoneNumberCopyWithImpl<T, $Res>;
  @override
  $Res call({String failMsg, T failedValue});
}

/// @nodoc
class _$InvalidPhoneNumberCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidPhoneNumberCopyWith<T, $Res> {
  _$InvalidPhoneNumberCopyWithImpl(
      InvalidPhoneNumber<T> _value, $Res Function(InvalidPhoneNumber<T>) _then)
      : super(_value, (v) => _then(v as InvalidPhoneNumber<T>));

  @override
  InvalidPhoneNumber<T> get _value => super._value as InvalidPhoneNumber<T>;

  @override
  $Res call({
    Object? failMsg = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(InvalidPhoneNumber<T>(
      failMsg: failMsg == freezed
          ? _value.failMsg
          : failMsg // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidPhoneNumber<T>
    with DiagnosticableTreeMixin
    implements InvalidPhoneNumber<T> {
  const _$InvalidPhoneNumber(
      {this.failMsg = "Invalid Phone Number!", required this.failedValue});

  @JsonKey()
  @override
  final String failMsg;
  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidPhoneNumber(failMsg: $failMsg, failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidPhoneNumber'))
      ..add(DiagnosticsProperty('failMsg', failMsg))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidPhoneNumber<T> &&
            const DeepCollectionEquality().equals(other.failMsg, failMsg) &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failMsg),
      const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidPhoneNumberCopyWith<T, InvalidPhoneNumber<T>> get copyWith =>
      _$InvalidPhoneNumberCopyWithImpl<T, InvalidPhoneNumber<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failMsg, T failedValue) invalidEmail,
    required TResult Function(String failMsg, T failedValue) shortPassword,
    required TResult Function(String failMsg, T failedValue) emptyField,
    required TResult Function(String failMsg, T failedValue) invalidPhoneNumber,
  }) {
    return invalidPhoneNumber(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
  }) {
    return invalidPhoneNumber?.call(failMsg, failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failMsg, T failedValue)? invalidEmail,
    TResult Function(String failMsg, T failedValue)? shortPassword,
    TResult Function(String failMsg, T failedValue)? emptyField,
    TResult Function(String failMsg, T failedValue)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(failMsg, failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
  }) {
    return invalidPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
  }) {
    return invalidPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    required TResult orElse(),
  }) {
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneNumber<T> implements ValueFailure<T> {
  const factory InvalidPhoneNumber({String failMsg, required T failedValue}) =
      _$InvalidPhoneNumber<T>;

  @override
  String get failMsg;
  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidPhoneNumberCopyWith<T, InvalidPhoneNumber<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
