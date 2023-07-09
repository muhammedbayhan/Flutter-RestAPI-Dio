import 'package:flutter/material.dart';

class Widget_Textfield extends StatelessWidget {
  Widget_Textfield({required this.controller, required this.labelText});
  TextEditingController controller;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
