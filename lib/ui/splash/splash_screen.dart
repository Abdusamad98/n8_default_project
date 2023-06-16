import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';

import '../../local/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String savedPassword = "";
  String savedEmail = "";

  @override
  void initState() {
    savedPassword = StorageRepository.getString("password");
    savedEmail = StorageRepository.getString("email");

    _init();
    super.initState();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.logo_dev,
          size: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
