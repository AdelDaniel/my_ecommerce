import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_id.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseAuthFacade({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<Either<AuthFailure, UserID>> registerWithEmailAndPassword({
    required String emailAddressString,
    required String passwordString,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressString, password: passwordString);
      if (userCredential.user != null) {
        return Right(UserID.fromFirebaseUniqueUserId(userCredential.user!.uid));
      } else {
        return const Left(AuthFailure.serverError());
      }
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
  Future<Either<AuthFailure, UserID>> signInWithEmailAndPassword({
    required String emailAddressString,
    required String passwordString,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: emailAddressString, password: passwordString);
      if (userCredential.user != null) {
        return Right(UserID.fromFirebaseUniqueUserId(userCredential.user!.uid));
      } else {
        return const Left(AuthFailure.serverError());
      }
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
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      log("User Data: \n\n email: ${googleUser.email}-- googleUser.photoUrl: ${googleUser.photoUrl}-- id: ${userCredential.user!.uid}-- displayName: ${googleUser.displayName}");
      return Right(
        SignedInUser(
          email: googleUser.email,
          id: userCredential.user!.uid,
          phoneNumber: "",
          //TODO get check for the display name and then return the name or the first part of the user email before @
          name: googleUser.displayName!,
          allWishListIds: [],
        ),
      );
    } catch (e) {
      log("$e");
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Option<String>> getSignedInUserID() async =>
      _firebaseAuth.currentUser != null
          ? some(_firebaseAuth.currentUser!.uid)
          : none();

  @override
  Future<void> signOut() async =>
      Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
}
