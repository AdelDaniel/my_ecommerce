import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/wish_list/presentation/bloc/wishlist_bloc.dart';
import '../models/models.dart';

class AddToWishListButton extends StatelessWidget {
  const AddToWishListButton({Key? key, required this.product, this.size = 24.0})
      : super(key: key);

  final double size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product.isWishListed) {
          context
              .read<WishlistBloc>()
              .add(RemoveProductFromWishListEvent(product));
        } else {
          context.read<WishlistBloc>().add(AddProductToWishListEvent(product));
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding: const EdgeInsets.all(3),
        child: BlocConsumer<WishlistBloc, WishlistState>(
            buildWhen: (previousState, currentState) {
          // build the widget in 2 cases
          // at errorState and contains the same product
          // at any other state
          if (currentState is ErrorWishListState) {
            return currentState.product == product;
          } else if (currentState is! ErrorWishListState) {
            return true;
          } else {
            return false;
          }
        }, listenWhen: (previousState, currentState) {
          // the dialog will only show ones when this specific button is pressed
          if (currentState is ErrorWishListState) {
            return currentState.product == product;
          }
          return false;
        }, listener: (context, state) {
          if (state is ErrorWishListState) {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.RIGHSLIDE,
                    isDense: true,
                    title: 'Oops! something went wrong..',
                    desc:
                        '${state.failure.mainMessage} \n ${state.failure.detailedMsg}',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnCancelText: 'Cancel',
                    btnCancelIcon: Icons.cancel,
                    btnCancelColor: Colors.red)
                .show();
          }
        }, builder: (builder, state) {
          log('bloc builder... Add To WishList Button:: $state ');
          // TODO convert to else if

          // if (state is RemovedFromWishList) {
          //   return WishListIcon(
          //       icon: Icons.favorite_outline_rounded, size: size);
          // }
          // if (state is LoadedWishListIdsState) {
          //   return WishListIcon(icon: Icons.favorite_rounded, size: size);
          // }
          if (state is LoadingWishListState) {
            return const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 3));
          }
          if (state is ErrorWishListState) {
            /// Error Icon when error happen
            return WishListIcon(icon: Icons.error, size: size);
          }

          /// (state is EmptyWishListState || LoadedWishListProductsState || LoadedWishListIdsState )
          return WishListIcon(
              icon: product.isWishListed
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              size: size);
        }),
      ),
    );
  }
}

class WishListIcon extends StatelessWidget {
  const WishListIcon({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.pink,
      size: size,
    );
  }
}
