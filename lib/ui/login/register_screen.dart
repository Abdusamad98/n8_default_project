import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/models/profile_model.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';
import 'package:n8_default_project/ui/login/widgets/universal_input_view.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterModel registerModel = RegisterModel(
    name: "",
    phoneNumber: "",
    email: "",
    birthday: "",
    password: "",
  );

  @override
  void initState() {
    super.initState();
  }

  Future<void> saveInputText(String key, String value) async {
    await StorageRepository.putString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 200,
                ),
                UniversalInputView(
                  format: InputFormatType.text,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    registerModel = registerModel.copyWith(name: value);
                  },
                  caption: "Name",
                  hintText: "Marvin McKinney",
                  initialValue: registerModel.name,
                ),
                UniversalInputView(
                  format: InputFormatType.email,
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    registerModel = registerModel.copyWith(email: value);
                  },
                  caption: "Email",
                  hintText: "Enter Email",
                  initialValue: registerModel.email,
                ),
                UniversalInputView(
                  format: InputFormatType.date,
                  inputType: TextInputType.datetime,
                  onChanged: (value) {
                    registerModel = registerModel.copyWith(birthday: value);
                  },
                  caption: "Date of birth",
                  hintText: "Enter birth date",
                  initialValue: registerModel.birthday,
                ),
                UniversalInputView(
                  format: InputFormatType.phone,
                  inputType: TextInputType.phone,
                  onChanged: (value) {
                    registerModel = registerModel.copyWith(phoneNumber: value);
                  },
                  caption: "Phone Number",
                  hintText: "Enter phone",
                  initialValue: registerModel.phoneNumber,
                ),
                UniversalInputView(
                  format: InputFormatType.password,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    registerModel = registerModel.copyWith(password: value);
                  },
                  caption: "Password",
                  hintText: "Enter password",
                  initialValue: registerModel.password,
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
                if (registerModel.canRegister().isEmpty) {
                  saveInputText("name", registerModel.name);
                  saveInputText("phone_number", registerModel.phoneNumber);
                  saveInputText("birthday", registerModel.birthday);
                  saveInputText("email", registerModel.email);
                  saveInputText("password", registerModel.password);
                  _navigateToLogin();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(registerModel.canRegister()),
                    ),
                  );
                }
              },
              child: const Text("REGIDTER"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _navigateToLogin();
              },
              child: const Text("Login"))
        ],
      ),
    );
  }

  _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }),
    );
  }
}
