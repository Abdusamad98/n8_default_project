import 'package:flutter/material.dart';
import 'package:n8_default_project/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_0001FC,
      appBar: AppBar(
        backgroundColor: AppColors.C_0001FC,
        title: const Text(
          "Deafult screen",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: ListView(
        //scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
            100,
            (index) => const ListTile(
              title: Text(
                "Deafult screen",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
