import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.blueAccent),
      controller: controller,
      decoration: const InputDecoration(
        filled: true,
        // fillColor: AppColors.TextFieldColor,
        hintText: 'search',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(),
        ),
      ),
    );
  }
}
