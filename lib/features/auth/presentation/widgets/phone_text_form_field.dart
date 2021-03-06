import 'package:flutter/material.dart';

import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    Key? key,
    required this.signInFormBloc,
  }) : super(key: key);
  final SignInFormBloc signInFormBloc;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue:
          signInFormBloc.state.phoneNumber.value.fold((_) => null, (r) => r),
      onChanged: (value) =>
          signInFormBloc.add(SignInFormEvent.phoneNumberChanged(value)),
      controller: signInFormBloc.state.phoneNumber.value.fold(
        (failure) => failure.maybeMap(
            emptyField: (failure) => TextEditingController()..clear(),
            orElse: () => null),
        (_) => null,
      ),
      validator: (_) => signInFormBloc.state.phoneNumber.value.fold(
        (fail) => fail.maybeMap(
          emptyField: (value) => value.failMsg,
          invalidPhoneNumber: (value) => value.failMsg,
          orElse: () => null,
        ),
        (r) => null,
      ),
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }
}
