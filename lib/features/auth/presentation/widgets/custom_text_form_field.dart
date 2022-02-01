import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? initialValue;
  final TextEditingController? controller;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 10,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
