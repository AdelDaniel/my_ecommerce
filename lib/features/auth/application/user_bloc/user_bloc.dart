import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_logging_repository.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_update_user_firestore_data.dart';
import 'package:my_ecommerce/features/auth/domain/models/signed_in_user.dart';
import 'package:my_ecommerce/features/auth/infrastructure/repositories/update_user_firestore_data.dart';

part 'user_event.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, Option<SignedInUser>> {
  final ILoggingRepository _loggingRepository;
  final IUpdateUserFirestoreData _updateUserFirestoreData;
  final AuthBloc _authBloc;
  UserBloc({
    required ILoggingRepository loggingRepository,
    required IUpdateUserFirestoreData updateUserFirestoreData,
    required AuthBloc authBloc,
  })  : _loggingRepository = loggingRepository,
        _updateUserFirestoreData = updateUserFirestoreData,
        _authBloc = authBloc,
        super(none()) {
    _authBloc.stream.listen(
      (authState) => authState.isAuthenticated
          ? add(const AuthCheckRequested())
          : add(const UserSignedOut()),
    );
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<UserSignedOut>(_onUserSignedOut);
    on<AddWishListIdToFireStore>(_onAddWishListIdToFireStore);
    on<RemoveWishListIdFromFireStore>(_onRemoveWishListIdFromFireStore);
  }
  Future<void> _onAuthCheckRequested(event, Emitter emit) async {
    final Option<SignedInUser> userOption =
        await _loggingRepository.getSignedInUser();
    emit(userOption);
    userOption.fold(
      () => UpdateUserFirestoreData.userId = const None(),
      (user) => UpdateUserFirestoreData.userId = Some(user.id),
    );
  }

  Future<void> _onUserSignedOut(event, Emitter emit) async {
    try {
      emit(const None());
      UpdateUserFirestoreData.userId = const None();
    } catch (e) {
      emit(state);
    }
  }

  Future<void> _onAddWishListIdToFireStore(
      AddWishListIdToFireStore event, Emitter emit) async {
    try {
      _updateUserFirestoreData.addWishListId(productId: event.productId);
    } catch (e) {
      emit(state);
    }
  }

  Future<void> _onRemoveWishListIdFromFireStore(
      RemoveWishListIdFromFireStore event, Emitter emit) async {
    try {
      _updateUserFirestoreData.removeWishListId(productId: event.productId);
    } catch (e) {
      emit(state);
    }
  }

  // Future<void> _onUpdateSingedInUser(
  //   UpdateSingedInUser event,
  //   Emitter emit,
  // ) async {
  //   emit(
  //     AuthState(
  //         signedInUser: event.user,
  //         isAuthenticated: false,
  //         isFirstTimeOpenTheApp: false),
  //   );
  // }

}
