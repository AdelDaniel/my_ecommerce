import 'package:flutter/material.dart';
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
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
