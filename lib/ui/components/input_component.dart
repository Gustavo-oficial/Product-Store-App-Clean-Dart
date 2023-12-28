import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.controller,
    this.primaryColor = Colors.purple,
    required this.label,
    this.keyboardType = TextInputType.text
  });
  final TextEditingController controller;
  final Color primaryColor;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border ({Color borderColor = Colors.grey}) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: borderColor
      )
    );

    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        enabledBorder: border(),
        focusedBorder: border(borderColor: primaryColor),
        label: Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }
}