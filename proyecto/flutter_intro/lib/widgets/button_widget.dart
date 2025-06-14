import 'package:flutter/material.dart';
/// Este es el campo de texto global reutilizable
class GlobalFormTextWidget extends StatelessWidget {
  const GlobalFormTextWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}

class CustomInputs extends StatelessWidget {
  const CustomInputs({
    super.key,
    required this.label,
    required this.hidden,
  });

  final String label;
  final bool hidden;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidden, 
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}