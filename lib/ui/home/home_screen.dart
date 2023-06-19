import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:n8_default_project/utils/icons.dart';
import 'package:n8_default_project/utils/ui_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialogs screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showMessage("No internet connection Try again!");
              },
              child: Text("SHOW MY DILAOG"),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator.adaptive(),
            SizedBox(height: 30),
            CupertinoActivityIndicator(
              color: Colors.black,
              radius: 15,
            ),
            SizedBox(height: 30),
            Lottie.asset(
              AppImages.loader,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
