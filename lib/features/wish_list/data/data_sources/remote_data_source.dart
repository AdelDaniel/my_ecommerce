import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/error/errors.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/features/auth/application/user_bloc/user_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';

abstract class AbstractRemoteDataSource {
  Future<List<String>> getAllWishListIds();
  Future<Unit> addWishListId({required String productId});
  Future<Unit> removeWishListId({required String productId});
}

class RemoteDataSource implements AbstractRemoteDataSource {
  static Option<DocumentReference> userDoc = const None();
  static Option<String> userId = const None();

  factory RemoteDataSource({
    required CollectionReference userCollectionRef,
    required UserBloc userBloc,
  }) {
    userBloc.stream.listen((Option<SignedInUser> optionUser) {
      optionUser.fold(
        () {
          userId = const None();
          userDoc = const None();
        },
        (signedInUser) async {
          userId = Some(signedInUser.id);
          userDoc = Some(userCollectionRef.doc(signedInUser.id));
        },
      );
    });
    return RemoteDataSource._(userBloc: userBloc);
  }

  final UserBloc _userBloc;

  const RemoteDataSource._({
    required UserBloc userBloc,
  }) : _userBloc = userBloc;

  @override
  Future<Unit> addWishListId({
    required String productId,
  }) async {
    try {
      if (userDoc.isSome()) {
        await userDoc.getOrElse(() => throw UnExceptedError()).update({
          "WishListIds": FieldValue.arrayUnion([productId])
        });
        return unit;
      } else {
        throw const UserAuthenticationException(
          detailedMsg: 'SomeThing Wrong with User Id',
        );
      }
    } catch (e) {
      log("$e");
      throw const ServerException(detailedMsg: 'Not Saved Remotely');
    }
  }

  @override
  Future<Unit> removeWishListId({
    required String productId,
  }) async {
    try {
      if (userDoc.isSome()) {
        await userDoc.getOrElse(() => throw UnExceptedError()).update({
          "WishListIds": FieldValue.arrayRemove([productId])
        });
        return unit;
      } else {
        throw const UserAuthenticationException(
          detailedMsg: 'SomeThing Wrong with User Id',
        );
      }
    } catch (e) {
      throw const ServerException(detailedMsg: 'Not Saved Remotely');
    }
  }

  @override
  Future<List<String>> getAllWishListIds() async {
    try {
      if (userDoc.isSome()) {
        if (_userBloc.state.isSome()) {
          late final SignedInUser signedInUser;
          _userBloc.state.fold(() => null, (user) => signedInUser = user);
          return signedInUser.allWishListIds;
        }
        return [];
      } else {
        throw const UserAuthenticationException(
            detailedMsg: 'Some Thing Wrong with User Id');
      }
    } catch (e) {
      throw const ServerException(detailedMsg: 'Not Saved Remotely');
    }
  }
}
