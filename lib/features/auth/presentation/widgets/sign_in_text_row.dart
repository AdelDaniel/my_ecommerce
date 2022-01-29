import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/presentation/screens/login_screen.dart';

class SignInTextRow extends StatelessWidget {
  const SignInTextRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
