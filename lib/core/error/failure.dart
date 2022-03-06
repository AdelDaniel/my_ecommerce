import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

abstract class IFailure {
  const IFailure();
  String get detailedMsg;
  String get mainMessage;
}

enum messages {
  loginInOrSignUp,
}
const Map<messages, String> getMessage = {
  messages.loginInOrSignUp: "please Login Or SignUp"
};

@freezed
abstract class Failure with _$Failure {
  @Implements<IFailure>()
  const factory Failure.serverFailure({
    @Default("Oops! Server Failure!") String mainMessage,
    required String detailedMsg,
  }) = ServerFailure;

  @Implements<IFailure>()
  const factory Failure.cacheFailure({
    @Default("Oops! Cache Failure!") String mainMessage,
    required String detailedMsg,
  }) = CacheFailure;

  @Implements<IFailure>()
  const factory Failure.localFailure({
    @Default("Oops! Local Failure!") String mainMessage,
    required String detailedMsg,
  }) = LocalFailure;

  @Implements<IFailure>()
  const factory Failure.noInternetFailure({
    @Default("Oops! No Internet Connection!") String mainMessage,
    @Default("Check Your Internet Connection! and try again")
        String detailedMsg,
  }) = NoInternetFailure;

  @Implements<IFailure>()
  const factory Failure.userAuthenticationFailure({
    @Default("Oops! Authentication Failure!") String mainMessage,
    required String detailedMsg,
  }) = UserAuthenticationFailure;

  @Implements<IFailure>()
  const factory Failure.unExpectedFailure({
    @Default("Oops! Something Unexpected Happen!!") String mainMessage,
    required String detailedMsg,
  }) = UnExpectedFailure;
}
