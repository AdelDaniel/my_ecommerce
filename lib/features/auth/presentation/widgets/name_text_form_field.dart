import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
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
              signInFormBloc.add(SignInFormEvent.nameChanged(value)),
          validator: (_) => signInFormBloc.state.name.value.fold(
            (fail) => fail.maybeMap(
              emptyField: (value) => value.failMsg,
              orElse: () => null,
            ),
            (r) => null,
          ),
          keyboardType: TextInputType.name,
          icon: Icons.person,
          hint: "Name",
        );
      },
    );
  }
}
