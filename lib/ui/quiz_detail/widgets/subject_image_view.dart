import 'package:flutter/material.dart';

class SubjectImageView extends StatelessWidget {
  const SubjectImageView({Key? key, required this.iconPath}) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
