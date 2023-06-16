import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';

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
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                StorageRepository.deleteString("password");
                StorageRepository.deleteString("email");
                StorageRepository.deleteString("phone_number");
                StorageRepository.deleteString("name");
                StorageRepository.deleteString("birthday");

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Account deleted")));

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
              child: Text("Log Out"))
        ],
      ),
    );
  }
}
