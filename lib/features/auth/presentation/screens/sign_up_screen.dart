import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';

import 'package:my_ecommerce/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/SignUpScreen';
  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignUpScreen());

  const SignUpScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10),

          /// Build scrollable main content
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /// header Custom App Bar.
                const SignUpClipShape(),
                const SizedBox(height: 10.0),

                /// form user management.
                const SignUpForm(),
                const SizedBox(height: 10.0),

                /// Sign in button.
                BlocBuilder<SignInFormBloc, SignInFormState>(
                  builder: (context, state) {
                    if (state.isSubmitting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return MainNavBarButton(
                        onPressed: () => context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed()),
                        buttonText: 'SIGN UP');
                  },
                ),

                // const SignInTextRow(),
                const SizedBox(height: 10.0),

                /// buttons additional choice.
                const LogWithSocial(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
