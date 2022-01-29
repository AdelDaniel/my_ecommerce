import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';
import 'package:my_ecommerce/widgets/main_nav_bar_button.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginScreen';
  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen());

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10),

          /// scrollable main content
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /// header Custom background shape.
                const LoginClipShape(),
                const SizedBox(height: 10.0),

                /// welcome Text Row.
                const WelcomeLoginText(),
                const SizedBox(height: 10.0),

                /// form user management.
                const LoginForm(),
                const SizedBox(height: 10.0),

                /// forget Pass Text Row.
                const ForgetPassTextRow(),
                const SizedBox(height: 10.0),

                // SignIn Button
                BlocBuilder<SignInFormBloc, SignInFormState>(
                  builder: (context, state) {
                    if (state.isSubmitting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return MainNavBarButton(
                        onPressed: () => context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed()),
                        buttonText: 'SIGN IN');
                  },
                ),

                /// sign Up Text Row.
                const NotHaveAccountSignUpText(),
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
