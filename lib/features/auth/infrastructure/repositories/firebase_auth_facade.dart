import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_form_value_objects.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseAuthFacade({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

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

      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressString, password: passwordString);
      return Right(
        SignedInUser(
          email: emailAddressString,
          name: nameString,
          phoneNumber: phoneNumberString,
          id: userCredential.user!.uid,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return const Left(AuthFailure.emailAlreadyInUse());
      } else {
        print(e);
        return const Left(AuthFailure.serverError());
      }
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

      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: emailAddressString, password: passwordString);
      log('message: signInWithEmailAndPassword ');
      return Right(SignedInUser(
        phoneNumber: " ",
        name: '',
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return const Left(AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        print(e);
        return const Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, SignedInUser>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return const Left(AuthFailure.cancelledByUser());
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential To pass it for firebase
      // firebase doesn't know what is googleSignInAuth
      // so will link between them by using "GoogleAuthProvider" form firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // use credential for sign in
      await _firebaseAuth.signInWithCredential(credential);
      return Right(SignedInUser(
          email: googleUser.email,
          id: googleUser.id,
          phoneNumber: "",
          name: googleUser.displayName!));
    } catch (e) {
      log("$e");
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Option<SignedInUser>> getSignedInUser() async =>
      _firebaseAuth.currentUser != null
          ? some(
              SignedInUser(
                  name: "",
                  email: _firebaseAuth.currentUser!.email!,
                  id: _firebaseAuth.currentUser!.uid,
                  phoneNumber: ""),
            )
          : none();

  @override
  Future<void> signOut() async =>
      Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
}
