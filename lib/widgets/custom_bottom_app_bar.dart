import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/login_screen.dart';

import '../screens/cart_screen.dart';
import 'cart_badge.dart';

class CustomBottmAppBar extends StatelessWidget {
  const CustomBottmAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home, color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, CartScreen.routeName),
                child:
                    const CartBadge()), // const Icon(Icons.shopping_cart, color: Colors.white)),
            IconButton(
                onPressed: () {
                  final authState = context.read<AuthBloc>().state;

                  if (authState.isAuthenticated) {
                    // TODO  will navigate to the user profile
                  } else {
                    // the user is not logging in
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  }
                },
                icon: const Icon(Icons.person, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
