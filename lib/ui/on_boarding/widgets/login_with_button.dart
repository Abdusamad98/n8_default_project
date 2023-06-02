import 'package:flutter/material.dart';
import 'package:n8_default_project/utils/colors.dart';

class LoginWithButton extends StatelessWidget {
  const LoginWithButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.icon,
      required this.color,
      required this.textColor})
      : super(key: key);

  final String title;
  final String icon;
  final Color color;
  final Color textColor;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Ink(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                icon,
                width: 25,
                height: 25,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
