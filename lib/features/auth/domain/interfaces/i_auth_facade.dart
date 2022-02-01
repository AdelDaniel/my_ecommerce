import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_id.dart';

abstract class IAuthFacade {
  Future<Option<String>> getSignedInUserID();
  Future<Either<AuthFailure, ID>> registerWithEmailAndPassword({
    required String emailAddressString,
    required String passwordString,
  });
  Future<Either<AuthFailure, ID>> signInWithEmailAndPassword({
    required String emailAddressString,
    required String passwordString,
  });

  Future<Either<AuthFailure, SignedInUser>> signInWithGoogle();
  Future<void> signOut();
}
