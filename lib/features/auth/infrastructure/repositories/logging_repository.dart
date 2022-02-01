import 'package:dartz/dartz.dart';

import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_logging_repository.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_user_firestore_database.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_form_value_objects.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_id.dart';

class LoggingRepository implements ILoggingRepository {
  final IAuthFacade _authFacade;
  final IUserFirestoreDatabase _userFirestoreDatabase;
  LoggingRepository(
      {required IAuthFacade authFacade,
      required IUserFirestoreDatabase userFirestoreDatabase})
      : _authFacade = authFacade,
        _userFirestoreDatabase = userFirestoreDatabase;

  @override
  Future<Either<AuthFailure, SignedInUser>> registerWithEmailAndPassword({
    required UserFormValueObjects valueObjects,
  }) async {
    try {
      // if it holds String In Right will return it >> else throw error
      // The coming state are impossible to happen because i checked it at bloc
      // but if there is a ValueFailure it will throw UnExceptedError
      final String emailAddressString =
          valueObjects.emailAddress.getValueOrCrash();
      final String passwordString = valueObjects.password.getValueOrCrash();
      final String phoneNumberString =
          valueObjects.phoneNumber.getValueOrCrash();
      final String nameString = valueObjects.name.getValueOrCrash();

      // create user with mail and password and return uid
      final Either<AuthFailure, ID> eitherAuthFailureOrID =
          await _authFacade.registerWithEmailAndPassword(
              emailAddressString: emailAddressString,
              passwordString: passwordString);

      // use the uid to save the user info in firestore
      final Either<AuthFailure, SignedInUser> eitherAuthFailureOrSignedInUser =
          await eitherAuthFailureOrID
              .fold<Future<Either<AuthFailure, SignedInUser>>>(
        (failure) => Future.value(Left(failure)),
        (ID id) async {
          return _userFirestoreDatabase.createNewUserData(
            signedInUser: SignedInUser(
              email: emailAddressString,
              name: nameString,
              phoneNumber: phoneNumberString,
              id: id.getIdOrCrash(),
            ),
          );
        },
      );
      return eitherAuthFailureOrSignedInUser.fold(
        (failure) => Left(failure),
        (signedInUser) => Right(signedInUser),
      );
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, SignedInUser>> signInWithEmailAndPassword({
    required UserFormValueObjects valueObjects,
  }) async {
    try {
      final String emailAddressString =
          valueObjects.emailAddress.getValueOrCrash();
      final String passwordString = valueObjects.password.getValueOrCrash();

      // get user id with mail and password and return uid
      final Either<AuthFailure, ID> eitherAuthFailureOrID =
          await _authFacade.signInWithEmailAndPassword(
              emailAddressString: emailAddressString,
              passwordString: passwordString);

      // use the uid to get the user info in firestore
      final Either<AuthFailure, SignedInUser> eitherAuthFailureOrSignedInUser =
          await eitherAuthFailureOrID
              .fold<Future<Either<AuthFailure, SignedInUser>>>(
        (failure) => Future.value(Left(failure)),
        (ID id) async =>
            _userFirestoreDatabase.getUserData(id: id.getIdOrCrash()),
      );
      return eitherAuthFailureOrSignedInUser.fold(
        (failure) => Left(failure),
        (signedInUser) => Right(signedInUser),
      );
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, SignedInUser>> signInWithGoogle() async {
    try {
      final Either<AuthFailure, SignedInUser> either =
          await _authFacade.signInWithGoogle();

      final Either<AuthFailure, SignedInUser> eitherAuthFailureOrSignedInUser =
          await either.fold<Future<Either<AuthFailure, SignedInUser>>>(
        (failure) => Future.value(Left(failure)),
        (SignedInUser signedInUser) async => _userFirestoreDatabase
            .createNewUserData(signedInUser: signedInUser),
      );
      return eitherAuthFailureOrSignedInUser.fold(
        (failure) => Left(failure),
        (signedInUser) => Right(signedInUser),
      );
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async => _authFacade.signOut();

  @override
  Future<Option<SignedInUser>> getSignedInUser() async {
    final Option<String> uid = await _authFacade.getSignedInUserID();
    return await uid.fold(
      () => none(),
      (uid) async {
        final Either<AuthFailure, SignedInUser> either =
            await _userFirestoreDatabase.getUserData(id: uid);
        return either.fold((l) => none(), (signedInUser) => some(signedInUser));
      },
    );
  }
}
