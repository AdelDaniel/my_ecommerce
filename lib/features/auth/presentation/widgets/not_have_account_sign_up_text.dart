import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/sign_up_screen.dart';

class NotHaveAccountSignUpText extends StatelessWidget {
  const NotHaveAccountSignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SignUpScreen.routeName);
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[200],
                  fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
