import 'package:flutter/material.dart';

class UniversalInput extends StatelessWidget {
  const UniversalInput({
    Key? key,
    required this.isObscure,
    required this.controller,
    required this.obscureTap,
  }) : super(key: key);

  final bool isObscure;
  final TextEditingController controller;
  final VoidCallback obscureTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: obscureTap,
        )),
      ),
    );
  }
}
