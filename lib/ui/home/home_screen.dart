import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller;

  String text = '';

  @override
  void initState() {
    text = widget.number.toString();
    controller = TextEditingController();
    controller.addListener(() {
      text = controller.text;
      setState(() {});
      print("CONTROLLER VALUE:${controller.text}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.C_0001FC,
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
          SizedBox(
            height: 100,
            child: TextField(
              textInputAction: TextInputAction.done,
              // 1 -usul
              onChanged: (value) {},
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              // maxLines: 12,
              // maxLength: 10,
              //minLines: 1,
              //2-usul
              onSubmitted: (value) {},
              controller: controller,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print("CONTROLLER VALUE:${controller.text}");
              },
              child: Text(
                text,
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
