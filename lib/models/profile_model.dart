import 'package:flutter/material.dart';

class RegisterModel {
  RegisterModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.birthday,
    required this.password,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final String birthday;
  final String password;

  RegisterModel copyWith({
    String? name,
    String? password,
    String? email,
    String? phoneNumber,
    String? birthday,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
    );
  }

  String canRegister() {
    if (name.length < 3) return "Name maydoni xato";
    if (email.length < 7) return "Email xato";
    if (birthday.length < 8) return "Sana xato";
    if (phoneNumber.length < 12) return "Phone number xato";
    if (password.length < 8) return "Password maydoni xato ";

    return "";
  }
}

enum InputFormatType {
  text,
  phone,
  date,
  email,
  password,
}
