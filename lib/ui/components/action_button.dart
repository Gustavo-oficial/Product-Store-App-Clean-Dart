import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.action,
    this.primary = true,
    required this.text
  });
  final VoidCallback action;
  final bool primary;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        width: width,
        decoration: BoxDecoration(
          color: primary ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: primary ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}