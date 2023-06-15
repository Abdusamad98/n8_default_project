import 'package:flutter/material.dart';

class ProfileModel {
  ProfileModel({
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.email,
    required this.addressText,
    required this.birthday,
    required this.studentId,
  });

  final String name;
  final String email;
  final String phoneNumber;
  final String birthday;
  final String studentId;
  final String addressText;
  final bool gender;

  ProfileModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? birthday,
    String? studentId,
    String? addressText,
    bool? gender,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      addressText: addressText ?? this.addressText,
      birthday: birthday ?? this.birthday,
      studentId: studentId ?? this.studentId,
    );
  }

  bool canSaveStudentData() {
    if (name.length < 3) return false;
    if (email.length < 7) return false;
    //if (addressText.length < 10) return false;
    if (phoneNumber.length < 12) return false;
    if (birthday.length < 8) return false;
    if (studentId.length < 4) return false;
    return true;
  }
}

enum InputFormatType {
  text,
  phone,
  date,
  email,
  id,
}
