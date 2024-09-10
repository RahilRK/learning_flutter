
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onButtonClick,
  });

  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final Function()? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
          onPressed: onButtonClick,
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // <-- Radius
            ),
          ),
          child: Text(text)),
    );
  }
}