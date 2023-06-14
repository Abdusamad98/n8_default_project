import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/local/storage_repository.dart';

import '../../models/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  List<ContactModel> contacts = [];
  List<String> contactsInMemory = [];

  @override
  void initState() {
    contacts = StorageRepository.getContacts();
    counter = StorageRepository.getInt("counter_value");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Saver"),
        actions: [
          IconButton(
              onPressed: () {
                showContactAddDialog((newContact) {
                  print(newContact.toString());
                  StorageRepository.setContact(newContact);
                  setState(() {
                    contacts.add(newContact);
                  });
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: contacts.isNotEmpty
          ? ListView(
              children: List.generate(contacts.length, (index) {
                ContactModel contactModel = contacts[index];
                return ListTile(
                  // leading: Image.network(contactModel.image),
                  title: Text(
                    contactModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: Colors.green,
                    ),
                  ),
                  subtitle: Text(
                    contactModel.phone,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                  ),
                );
              }),
            )
          : const Center(child: Text("No contacts")),
    );
  }

  void showContactAddDialog(ValueChanged<ContactModel> contactCallBack) {
    String phone = "";
    String name = "";
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    onChanged: (v) {
                      name = v;
                    },
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(
                          r'\+998\s+\([0-9]{2}\)\s+[0-9]{3}\s+[0-9]{2}\s+[0-9]{2}'))
                    ],
                    onChanged: (v) {
                      phone = v;
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone",
                    ),
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                      onPressed: () {
                        if ((name.length > 3) && (phone.length > 10)) {
                          contactCallBack
                              .call(ContactModel(phone: phone, name: name));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Save"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
