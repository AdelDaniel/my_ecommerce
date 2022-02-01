import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_user_firestore_database.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';

class UserFirestoreDatabase implements IUserFirestoreDatabase {
  final CollectionReference _usersCollectionReference;
  const UserFirestoreDatabase(
      {required CollectionReference usersCollectionReference})
      : _usersCollectionReference = usersCollectionReference;

  @override
  Future<Either<AuthFailure, SignedInUser>> createNewUserData(
      {required SignedInUser signedInUser}) async {
    try {
      await _usersCollectionReference
          .doc(signedInUser.id)
          .set(signedInUser.setToFireBase());
      return Right(signedInUser);
    } catch (e) {
      log("error createNewUserData:$e");
      return const Left(AuthFailure.userNotSavedInFireStoreDataBase());
    }
  }

  @override
  Future<Either<AuthFailure, SignedInUser>> getUserData(
      {required String id}) async {
    try {
      final documentSnapshot = await _usersCollectionReference.doc(id).get();
      if (documentSnapshot.data() != null) {
        return Right(SignedInUser.fromFireStore(
            id: id, map: documentSnapshot.data()! as Map<String, dynamic>));
      } else {
        return Right(SignedInUser.fromFireStore(id: id, map: {}));
      }
    } catch (e) {
      log("error :$e");
      return const Left(AuthFailure.userNotSavedInFireStoreDataBase());
    }
  }

  @override
  Future<void> updateUserData({required String id}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}
