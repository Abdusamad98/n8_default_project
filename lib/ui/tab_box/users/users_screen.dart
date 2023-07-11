import 'package:flutter/material.dart';
import 'package:n8_default_project/data/network/providers/api_provider.dart';
import 'package:n8_default_project/data/network/repositories/login_repo.dart';
import 'package:n8_default_project/data/network/repositories/user_repo.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.userRepo}) : super(key: key);

  final UserRepo userRepo;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users screen"),
        actions: [
          IconButton(
              onPressed: () {
                widget.userRepo.logOutUser();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen(
                          loginRepo: LoginRepo(apiProvider: ApiProvider()));
                    },
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
