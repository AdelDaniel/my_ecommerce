import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/auth_failures.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/domain/models/user_form_value_objects.dart';

abstract class ILoggingRepository {
  Future<Option<SignedInUser>> getSignedInUser();
  Future<Either<AuthFailure, SignedInUser>> registerWithEmailAndPassword({
    required UserFormValueObjects valueObjects,
  });
  Future<Either<AuthFailure, SignedInUser>> signInWithEmailAndPassword({
    required UserFormValueObjects valueObjects,
  });

  Future<Either<AuthFailure, SignedInUser>> signInWithGoogle();
  Future<void> signOut();
}
