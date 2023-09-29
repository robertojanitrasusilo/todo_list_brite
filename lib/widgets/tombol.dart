import 'package:flutter/material.dart';
import 'package:todo_list/theme.dart';

class Tombol extends StatelessWidget {
  final String text;
  final Color colorText;
  final VoidCallback onPressed;
  final Color colorButton;
  const Tombol(
      {super.key,
      required this.text,
      required this.colorText,
      required this.onPressed,
      required this.colorButton});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        fixedSize: const Size(327, 48));
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(text, style: body2.copyWith(color: colorText)),
    );
  }
}
