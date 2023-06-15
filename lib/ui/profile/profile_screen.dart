import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/models/profile_model.dart';
import 'package:n8_default_project/ui/profile/widgets/universal_input_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileModel profileModel;
  bool isMale = false;

  @override
  void initState() {
    profileModel = ProfileModel(
      name: StorageRepository.getString("name"),
      phoneNumber: StorageRepository.getString("phone_number"),
      gender: StorageRepository.getBool("gender"),
      email: StorageRepository.getString("email"),
      addressText: "",
      birthday: StorageRepository.getString("birthday"),
      studentId: StorageRepository.getString("student_id"),
    );
    isMale = profileModel.gender;
    super.initState();
  }

  Future<void> saveInputText(String key, String value) async {
    await StorageRepository.putString(key, value);
  }

  Future<void> saveInputBool(String key, bool value) async {
    await StorageRepository.putBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                UniversalInputView(
                  format: InputFormatType.text,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    profileModel = profileModel.copyWith(name: value);
                  },
                  caption: "Name",
                  hintText: "Marvin McKinney",
                  initialValue: profileModel.name,
                ),
                UniversalInputView(
                  format: InputFormatType.email,
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    profileModel = profileModel.copyWith(email: value);
                  },
                  caption: "Email",
                  hintText: "Enter Email",
                  initialValue: profileModel.email,
                ),
                UniversalInputView(
                  format: InputFormatType.date,
                  inputType: TextInputType.datetime,
                  onChanged: (value) {
                    profileModel = profileModel.copyWith(birthday: value);
                  },
                  caption: "Date of birth",
                  hintText: "Enter birth date",
                  initialValue: profileModel.birthday,
                ),
                UniversalInputView(
                  format: InputFormatType.phone,
                  inputType: TextInputType.phone,
                  onChanged: (value) {
                    profileModel = profileModel.copyWith(phoneNumber: value);
                  },
                  caption: "Phone Number",
                  hintText: "Enter phone",
                  initialValue: profileModel.phoneNumber,
                ),
                UniversalInputView(
                  format: InputFormatType.id,
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    profileModel = profileModel.copyWith(studentId: value);
                  },
                  caption: "Student ID",
                  hintText: "Enter student ID",
                  isStudentId: true,
                  initialValue: profileModel.studentId,
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMale = false;
                              profileModel =
                                  profileModel.copyWith(gender: isMale);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isMale ? Colors.grey : Colors.blue,
                          ),
                          child: const Text("Female"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMale = !isMale;
                              profileModel =
                                  profileModel.copyWith(gender: isMale);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isMale ? Colors.blue : Colors.grey,
                          ),
                          child: const Text("Male"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (profileModel.canSaveStudentData()) {
                  saveInputText("name", profileModel.name);
                  saveInputText("student_id", profileModel.studentId);
                  saveInputText("phone_number", profileModel.phoneNumber);
                  saveInputText("birthday", profileModel.birthday);
                  saveInputText("email", profileModel.email);
                  saveInputBool("gender", profileModel.gender);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ma'lumotlar xato"),
                    ),
                  );
                }
              },
              child: Text("Save Profile data"),
            ),
          ),
        ],
      ),
    );
  }
}
