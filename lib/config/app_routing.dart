import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/catalog_screen.dart';
import 'package:my_ecommerce/home_screen.dart';
import 'package:my_ecommerce/product_details_screen.dart';
import 'package:my_ecommerce/settings/settings_screen.dart';
import 'package:my_ecommerce/wishList_screen.dart';

import '../cart_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    print({'this is a ${settings.name}'});

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route();
      case ProductDetailsScreen.routeName:
        return ProductDetailsScreen.route();
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SettingsScreen.routeName:
        return SettingsScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: "/error"),
        builder: (_) => Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    "Oops! \n SomeThing went Wrong",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ));
  }
}
