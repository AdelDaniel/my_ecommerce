import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';
import 'package:my_ecommerce/screens/home_screen/home_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInFormBloc signInFormBloc = context.read<SignInFormBloc>();
    return _CustomForm(
      formFields: <Widget>[
        /// TextFormField for adding Name.
        NameTextFormField(signInFormBloc: signInFormBloc),
        const SizedBox(height: 20.0),

        /// TextFormField for adding email.
        EmailTextFormField(signInFormBloc: signInFormBloc),
        const SizedBox(height: 20.0),

        /// TextFormField for adding phone.
        PhoneTextFormField(signInFormBloc: signInFormBloc),
        const SizedBox(height: 20.0),

        /// TextFormField for adding password.
        PasswordTextFormField(signInFormBloc: signInFormBloc),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInFormBloc signInFormBloc = context.read<SignInFormBloc>();
    return _CustomForm(
      formFields: <Widget>[
        /// email Text Form Field
        EmailTextFormField(signInFormBloc: signInFormBloc),
        const SizedBox(height: 10.0),

        /// password Text Form Field
        PasswordTextFormField(signInFormBloc: signInFormBloc),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _CustomForm extends StatelessWidget {
  const _CustomForm({Key? key, required this.formFields}) : super(key: key);

  final List<Widget> formFields;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: BlocConsumer<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          log('message $state');
          state.authFailureOrSuccessOption.fold(
            () => null,
            (eitherValue) => eitherValue.fold(
              (fail) {
                return FlushbarHelper.createError(
                  message: fail.map(
                      cancelledByUser: (f) => f.failMsg,
                      serverError: (f) => f.failMsg,
                      emailAlreadyInUse: (f) => f.failMsg,
                      invalidEmailAndPasswordCombination: (f) => f.failMsg),
                ).show(context);
              },
              (r) {
                context.read<AuthBloc>().add(const AuthCheckRequested());
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
          );
        },
        builder: (context, state) => Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(children: formFields),
        ),
      ),
    );
  }
}
