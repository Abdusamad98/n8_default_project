import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 200,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
