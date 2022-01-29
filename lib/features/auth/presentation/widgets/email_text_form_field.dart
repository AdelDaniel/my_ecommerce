import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
    required this.signInFormBloc,
  }) : super(key: key);
  final SignInFormBloc signInFormBloc;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomTextFormField(
          initialValue: signInFormBloc.state.emailAddress.value
              .fold((_) => null, (r) => r),
          onChanged: (value) =>
              signInFormBloc.add(SignInFormEvent.emailChanged(value)),
          validator: (_) => signInFormBloc.state.emailAddress.value.fold(
            (fail) => fail.maybeMap(
              emptyField: (value) => value.failMsg,
              invalidEmail: (value) => value.failMsg,
              orElse: () => null,
            ),
            (r) => null,
          ),
          keyboardType: TextInputType.emailAddress,
          icon: Icons.email,
          hint: "Email ID",
        );
      },
    );
  }
}
