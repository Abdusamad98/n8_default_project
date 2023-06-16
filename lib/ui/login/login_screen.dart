import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/login/register_screen.dart';
import 'package:n8_default_project/ui/login/widgets/universal_input_view.dart';

import '../../models/profile_model.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password = "";
  String email = "";

  String savedPassword = "";
  String savedEmail = "";

  @override
  void initState() {
    savedPassword = StorageRepository.getString("password");
    savedEmail = StorageRepository.getString("email");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login user"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 200,
                ),
                UniversalInputView(
                  format: InputFormatType.email,
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  caption: "Email",
                  hintText: "Enter Email",
                  initialValue: "",
                ),
                UniversalInputView(
                  format: InputFormatType.password,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    password = value;
                  },
                  caption: "Password",
                  hintText: "Enter password",
                  initialValue: "",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if ((savedPassword == password) && (savedEmail == email)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }),
                  );
                }
              },
              child: Text("LOGIN"),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }),
                  );
                },
                child: const Text("Register")),
          )
        ],
      ),
    );
  }
}
