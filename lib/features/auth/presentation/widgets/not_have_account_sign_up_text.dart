import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
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
              // to clear the SignInFormState to be empty when navigate between signIn and Register
              Navigator.of(context).pushNamed(SignUpScreen.routeName).then(
                  (_) => context
                      .read<SignInFormBloc>()
                      .add(const SwitchBetweenSignInAndRegister()));
              context
                  .read<SignInFormBloc>()
                  .add(const SwitchBetweenSignInAndRegister());
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
