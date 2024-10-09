import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool isPassword;
  final TextInputAction action;
  final String? Function(String? value) validator;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.inputType,
    required this.validator,
    required this.controller,
    this.isPassword = false,
    this.action = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          label: Text(label),
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 161, 161, 161),
          ),
        ),
        keyboardType: inputType,
        obscureText: isPassword,
        textInputAction: action,
        controller: controller,
      ),
    );
  }
}
