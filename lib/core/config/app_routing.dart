import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:my_ecommerce/screens/checkout_screen.dart';
import 'package:my_ecommerce/screens/intro_choose_language_and_theme_screen.dart';
import 'package:my_ecommerce/screens/intro_overboard_screen.dart';
import 'package:my_ecommerce/screens/splash_screen.dart';

import '../../models/models.dart';
import '../../screens/cart_screen.dart';
import '../../screens/catalog_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/product_details_screen.dart';
import '../../screens/wish_list_screen.dart';
import '../../settings/settings_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  print({'this is a ${settings.name}'});

  switch (settings.name) {
    case HomeScreen.routeName:
      return HomeScreen.route();
    case CartScreen.routeName:
      return CartScreen.route();
    case CatalogScreen.routeName:
      return CatalogScreen.route();
    case ProductDetailsScreen.routeName:
      return ProductDetailsScreen.route(settings.arguments! as Product);
    case WishListScreen.routeName:
      return WishListScreen.route();
    case SettingsScreen.routeName:
      return SettingsScreen.route();
    case CheckoutScreen.routeName:
      return CheckoutScreen.route();
    case IntroOverboardScreen.routeName:
      return IntroOverboardScreen.route();
    case IntroChooseLanguageAndThemeScreen.routeName:
      return IntroChooseLanguageAndThemeScreen.route();
    case LoginScreen.routeName:
      return LoginScreen.route();
    case SignUpScreen.routeName:
      return SignUpScreen.route();
    case SplashScreen.routeName:
      return SplashScreen.route();

    default:
      return _errorRoute();
  }
}

Route _errorRoute() => MaterialPageRoute(
      settings: const RouteSettings(name: "/error"),
      builder: (_) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Center(
            child: Text(
              "Oops! \n SomeThing went Wrong",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
