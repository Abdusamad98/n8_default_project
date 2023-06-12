import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  GlobalButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.withBorder = false,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback onTap;
  bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: withBorder ? color : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
