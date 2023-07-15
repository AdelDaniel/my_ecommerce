part of 'user_bloc.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.authCheckRequested() = AuthCheckRequested;
  const factory UserEvent.userSignedOut() = UserSignedOut;
  const factory UserEvent.addWishListIdToFireStore(
      {required String productId}) = AddWishListIdToFireStore;
  const factory UserEvent.removeWishListIdFromFireStore(
      {required String productId}) = RemoveWishListIdFromFireStore;
}
