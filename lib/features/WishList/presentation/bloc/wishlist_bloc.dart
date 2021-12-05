import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(LoadingWishListState()) {
    on<WishlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
