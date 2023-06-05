import 'package:flutter/material.dart';

class PageItemView extends StatelessWidget {
  PageItemView({Key? key, required this.number}) : super(key: key);

  int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: MediaQuery.of(context).size.height * (110 / 812) + 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Color(0xFF0001FC)),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }
}
