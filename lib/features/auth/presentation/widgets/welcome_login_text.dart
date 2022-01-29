import 'package:flutter/material.dart';
import 'package:my_ecommerce/core/constants/constants.dart';

class WelcomeLoginText extends StatelessWidget {
  const WelcomeLoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: constMarginHerizontal),
      child: Column(
        children: [
          Row(
            children: const <Widget>[
              FittedBox(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                "Sign in to your account",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 17.5,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
