import 'package:flutter/material.dart';

class ReusableForm extends StatelessWidget {
  const ReusableForm(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isHidden,
      required this.icon,
      required this.iconPressed});
  final TextEditingController controller;
  final String hintText;
  final bool isHidden;
  final VoidCallback iconPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
        suffixIcon: IconButton(onPressed: iconPressed, icon: Icon(icon)),
      ),
      obscureText: isHidden,
      cursorColor: Colors.black54,
    );
  }
}
