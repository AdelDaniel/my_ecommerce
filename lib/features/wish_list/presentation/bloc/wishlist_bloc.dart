import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/features/wish_list/domain/entities/wish_list_id.dart';
import 'package:my_ecommerce/features/wish_list/domain/usecases/remove_all_wish_list.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/wish_list_id_params.dart';
import '../../../../models/models.dart';
import '../../domain/usecases/usecases.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

/// Events:_ GetAllWishListIdsEvent &&  AddProductToWishListEvent && RemoveProductFromWishListEvent
/// states: LoadingWishListState && LoadedWishListIdsState && EmptyWishListState && LoadedWishListProductsState && ErrorWishListState
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetAllWishListIdsUseCase getAllWishListIdsUseCase;
  final AddToWishListUseCase addWishListIdUseCase;
  final RemoveFromWishListUseCase removeWishListIdUseCase;
  final GetAllWishListProductsUseCase getAllWishListProductsUseCase;
  final RemoveAllUseCase removeAllUseCase;

  WishlistBloc(
      {required this.getAllWishListIdsUseCase,
      required this.getAllWishListProductsUseCase,
      required this.addWishListIdUseCase,
      required this.removeWishListIdUseCase,
      required this.removeAllUseCase})
      : super(const LoadingWishListState(ids: [])) {
    on<GetAllWishListIdsEvent>(_onGetAllWishListIdsEvent);
    on<AddProductToWishListEvent>(_onAddProductToWishListEvent);
    on<RemoveProductFromWishListEvent>(_onRemoveProductFromWishListEvent);
    on<RemoveAllWishList>(_onRemoveAllWishList);
  }

  Future<void> _onGetAllWishListIdsEvent(event, Emitter emit) async {
    emit(LoadingWishListState(ids: state.ids));
    final Either<Failure, List<String>> eitherResult =
        await getAllWishListIdsUseCase.call();
    return _eitherResultCheck(emit, eitherResult, null);
  }

  Future<void> _onAddProductToWishListEvent(
      AddProductToWishListEvent event, Emitter emit) async {
    emit(LoadingWishListState(ids: state.ids));
    log('AddProductToWishListEvent');
    final eitherResult = await addWishListIdUseCase(
        params: WishListParams(product: event.product));
    await _eitherResultCheck(emit, eitherResult, event.product);
  }

  Future<void> _onRemoveProductFromWishListEvent(
      RemoveProductFromWishListEvent event, Emitter emit) async {
    emit(LoadingWishListState(ids: state.ids));
    log('RemoveProductFromWishListEvent');
    final eitherResult = await removeWishListIdUseCase.call(
        params: WishListParams(product: event.product));
    await _eitherResultCheck(emit, eitherResult, event.product);
  }

  Future<FutureOr<void>> _onRemoveAllWishList(
      RemoveAllWishList event, Emitter emit) async {
    emit(LoadingWishListState(ids: state.ids));
    log('RemoveAll');
    final eitherResult = await removeAllUseCase.call();
    eitherResult.fold(
      (failure) => emit(ErrorWishListState(ids: state.ids, failure: failure)),
      (_) => emit(const EmptyWishListState()),
    );
  }

  Future<void> _eitherResultCheck(Emitter emit,
      Either<Failure, List<String>> eitherResult, Product? product) async {
    log("eitherResult WishlistBloc: $eitherResult");
    eitherResult.fold(
      (failure) {
        // failure.map(
        //     serverFailure: serverFailure,
        //     cacheFailure: cacheFailure,
        //     localFailure: localFailure,
        //     noInternetFailure: noInternetFailure,
        //     userAuthenticationFailure: userAuthenticationFailure,
        //     unExpectedFailure: unExpectedFailure);
        emit(ErrorWishListState(
            ids: state.ids, failure: failure, product: product));
      },
      (wishListIDs) => wishListIDs.isEmpty
          ? emit(const EmptyWishListState())
          : emit(LoadedWishListIdsState(
              wishListIDs,
            )),
    );
  }
}
