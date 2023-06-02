import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class UniversalInput extends StatelessWidget {
  UniversalInput({
    Key? key,
    required this.title,
    required this.hintText,
    required this.type,
    this.isPassword = false,
  }) : super(key: key);

  final String title;
  final String hintText;
  final TextInputType type;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.white,
              fontFamily: "SF-Pro",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            textInputAction: TextInputAction.done,
            cursorColor: AppColors.white,
            cursorHeight: 20,
            cursorWidth: 1.5,
            keyboardType: type,
            onChanged: (value) {
              print("CURRENT VALUE:$value");
            },
            onSubmitted: (value) {
              print("SUBMITTED VALUE:$value");
            },
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.white,
              fontFamily: "SF-Pro",
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.white,
                fontFamily: "SF-Pro",
              ),
              fillColor: Colors.red,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              // errorText: "Error",
              // enabled: false,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
