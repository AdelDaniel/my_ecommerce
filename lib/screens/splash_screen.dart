import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/screens/home_screen/home_screen.dart';
import 'package:my_ecommerce/screens/intro_choose_language_and_theme_screen.dart';
import 'package:my_ecommerce/screens/intro_overboard_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/Splash-Screen";
  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen());
  const SplashScreen();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        // if first time >> open IntroChooseLanguageAndThemeScreen
        // if not first time and not authenticated >> IntroOverboardScreen
        // if not first time and authenticated >> HomeScreen
        if (authState.isFirstTimeOpenTheApp) {
          Navigator.pushReplacementNamed(
              context, IntroChooseLanguageAndThemeScreen.routeName);
        } else if (authState.isAuthenticated) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(
              context, IntroOverboardScreen.routeName);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/shopping_cart_icon.png',
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.35,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
