import 'package:flutter/material.dart';

Widget getRichText(String text1, String text2, BuildContext context) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontWeight: FontWeight.w400),
      children: <TextSpan>[
        TextSpan(
          text: text2,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget getRichTextForCount(String text1, String text2, BuildContext context) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
      children: <TextSpan>[
        TextSpan(
          text: text2,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

String getMinutelyText(int timeInSeconds) {
  //1 hour > seconds > 0
  int min = timeInSeconds ~/ 60;
  int sec = timeInSeconds % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $second";
}
