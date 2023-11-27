import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const DecoratedTextField({required this.hintText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText
      ),
    );
  }
}
