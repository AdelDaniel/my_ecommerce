import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/not_have_account_sign_up_text.dart';

import 'package:my_ecommerce/screens/home_screen/home_screen.dart';
import 'package:my_ecommerce/widgets/widgets.dart';

class IntroOverboardScreen extends StatelessWidget {
  static const routeName = '/IntroOverboardScreen';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => IntroOverboardScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Hero(
                          tag: 'splash-logo',
                          child: Image.asset(
                            'assets/images/shopping_cart_icon.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const IntroOverboardCarouselSlider(),
                        MainNavBarButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(LoginScreen.routeName),
                            buttonText: 'Login'),
                        const NotHaveAccountSignUpText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromRGBO(136, 98, 4, 1),
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
