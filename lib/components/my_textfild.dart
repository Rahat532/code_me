import 'package:flutter/material.dart';

class Mytextfild extends StatelessWidget {
  final String hintTex;
  final bool obscureText;
  final TextEditingController controller;

  const Mytextfild({
    super.key,
    required this.hintTex,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText, // Use the obscureText property here
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade50),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amberAccent),
          ),
          fillColor: Colors.blue.shade50,
          filled: true,
          hintText: hintTex,
          hintStyle: const TextStyle(color: Colors.black54), // Corrected from helperStyle to hintStyle
        ),
      ),
    );
  }
}

