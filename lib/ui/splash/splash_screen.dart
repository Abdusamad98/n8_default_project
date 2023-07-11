import 'package:flutter/material.dart';
import 'package:n8_default_project/data/local/storage_repository.dart';
import 'package:n8_default_project/data/network/providers/api_provider.dart';
import 'package:n8_default_project/data/network/repositories/login_repo.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';
import 'package:n8_default_project/ui/tab_box/tab_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ApiProvider apiProvider = ApiProvider();

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    String token = StorageRepository.getString("token");
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return token.isNotEmpty
                ? TabBox(apiProvider: apiProvider)
                : LoginScreen(loginRepo: LoginRepo(apiProvider: apiProvider));
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.shop,
          size: 200,
          color: Colors.green,
        ),
      ),
    );
  }
}
