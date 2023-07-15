import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_update_user_firestore_data.dart';

class UpdateUserFirestoreData implements IUpdateUserFirestoreData {
  static late final DocumentReference? _userDoc;
  static Option<String> userId = const None();
  DocumentReference? get userDoc {
    return userId.fold<DocumentReference?>(
        () => null, (id) => _userDoc ??= _userCollectionRef.doc(id));
  }

  final CollectionReference _userCollectionRef;
  const UpdateUserFirestoreData(
      {required CollectionReference userCollectionRef})
      : _userCollectionRef = userCollectionRef;

  @override
  Future<Either<Failure, Unit>> addWishListId({
    required String productId,
  }) async {
    try {
      if (_userDoc != null) {
        await _userDoc!.update({
          "WishListIds": FieldValue.arrayUnion([productId])
        });
        return const Right(unit);
      } else {
        return left(const UserAuthenticationFailure(
            detailedMsg: 'Some Thing Wrong with User Id'));
      }
    } catch (e) {
      return left(const ServerFailure(detailedMsg: 'Not Saved Remotely'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWishListId({
    required String productId,
  }) async {
    try {
      if (_userDoc != null) {
        await _userDoc!.update({
          "WishListIds": FieldValue.arrayRemove([productId])
        });
        return const Right(unit);
      } else {
        return left(const UserAuthenticationFailure(
            detailedMsg: 'Some Thing Wrong with User Id'));
      }
    } catch (e) {
      return left(const ServerFailure(detailedMsg: 'Not Saved Remotely'));
    }
  }
}
