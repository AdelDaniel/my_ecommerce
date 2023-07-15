import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';

abstract class IUserFirestoreDatabase {
  const IUserFirestoreDatabase();
  Future<Either<AuthFailure, SignedInUser>> getUserData({
    required String id,
  });
  Future<Either<AuthFailure, SignedInUser>> createNewUserData({
    required SignedInUser signedInUser,
  });
}
