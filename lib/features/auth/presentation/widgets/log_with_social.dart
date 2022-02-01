import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';

class LogWithSocial extends StatelessWidget {
  const LogWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Or create using   ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: <Widget>[
              BlocBuilder<SignInFormBloc, SignInFormState>(
                builder: (context, state) {
                  if (state.isSubmitting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return FloatingActionButton.extended(
                    onPressed: () => context
                        .read<SignInFormBloc>()
                        .add(const SignInFormEvent.signInWithGooglePressed()),
                    icon: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/google_logo.png"),
                    ),
                    label: const Text("Continue With Google"),
                  );
                },
              ),

              const SizedBox(width: 10),
              // TODO :: login with fb and twitter
              // CircleAvatar(
              //   radius: 15,
              //   backgroundImage: AssetImage("assets/images/fb_logo.png"),
              // ),
              // SizedBox(width: 20),
              // CircleAvatar(
              //   radius: 15,
              //   backgroundImage: AssetImage("assets/images/twitter_logo.png"),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
