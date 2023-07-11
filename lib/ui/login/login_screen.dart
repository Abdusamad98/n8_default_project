import 'package:flutter/material.dart';
import 'package:n8_default_project/data/network/providers/api_provider.dart';
import 'package:n8_default_project/data/network/repositories/login_repo.dart';
import 'package:n8_default_project/ui/tab_box/tab_box.dart';
import 'package:n8_default_project/ui/widgets/global_button.dart';
import 'package:n8_default_project/utils/utility_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.loginRepo});

  final LoginRepo loginRepo;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernameController,
                  decoration: getTextFieldDecoration("username"),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: passwordController,
                  decoration: getTextFieldDecoration("password"),
                ),
                const SizedBox(height: 24),
                GlobalButton(
                    text: "Login",
                    onTap: () async {
                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        bool isLogged = await widget.loginRepo.loginUser(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (isLogged && context.mounted) {
                          showCustomMessage(context, "User Logged");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TabBox(apiProvider: ApiProvider());
                              },
                            ),
                          );
                        } else {
                          showCustomMessage(context, "Error occurred...");
                        }
                      } else {
                        showCustomMessage(context, "Login data not valid!!!");
                      }
                    })
              ],
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
