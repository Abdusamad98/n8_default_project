import 'package:flutter/material.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/ui/widgets/contact_search_view.dart';

import '../models/contact_model/contact_model.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({super.key});

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  List<String> options = <String>[
    'Default',
    'A-Z',
    'Z-A',
  ];
  String dropdownValue = 'Default';

  String searchText = "";

  int selectedMenu = 1;

  List<ContactModelSql> contacts = [];
  List<ContactModelSql> allContacts = [];

  _updateContacts() async {
    allContacts = await LocalDatabase.getAllContacts();
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  _getContactsByAlp(String order) async {
    contacts = await LocalDatabase.getContactsByAlphabet(order);
    setState(() {});
  }

  _getContactsByQuery(String query) async {
    contacts = await LocalDatabase.getContactsByQuery(query);
    setState(() {});
  }

  @override
  void initState() {

    _updateContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                searchText = await showSearch(
                  context: context,
                  delegate: ContactSearchView(
                    suggestionList: allContacts.map((e) => e.name).toList(),
                  ),
                );
               if(searchText.isNotEmpty) _getContactsByQuery(searchText);
                print("RESULT:$searchText");
              },
              icon: const Icon(Icons.search),
            ),
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              onSelected: (int item) {
                setState(() {
                  selectedMenu = item;
                });
                if (selectedMenu == 1) {
                } else {
                  _getContactsByAlp(selectedMenu == 2 ? "ASC" : "DESC");
                }
              },
             // offset: Offset(-50, 0),
                position: PopupMenuPosition.values.last,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Delete all'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Sort by A-Z'),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text('Sort by Z-A'),
                ),
              ],
            ),
          ],
          title: const Text("My Contacts"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Name",
                    fillColor: Colors.blue[200]),
                value: dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                style: const TextStyle(color: Colors.blue),
                selectedItemBuilder: (BuildContext context) {
                  return options.map((String value) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dropdownValue,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList();
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  contacts.length,
                  (index) => ListTile(
                    title: Text(contacts[index].name),
                    subtitle: Text(
                        "${contacts[index].phone} ID:${contacts[index].id.toString()}"),
                    trailing: IconButton(
                      onPressed: () {
                        _updateSingleContact(contacts[index]);
                        _updateContacts();
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    onLongPress: () {
                      LocalDatabase.deleteContact(contacts[index].id!);
                      _updateContacts();
                    },
                  ),
                ),
              ),
              // child: FutureBuilder<List<ContactModelSql>>(
              //   future: LocalDatabase.getAllContacts(),
              //   builder: (
              //     context,
              //     AsyncSnapshot<List<ContactModelSql>> rowData,
              //   ) {
              //     if (rowData.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (rowData.hasData) {
              //       List<ContactModelSql> contacts = rowData.data!;
              //       return ListView(
              //         children: List.generate(
              //           contacts.length,
              //           (index) => ListTile(
              //             title: Text(contacts[index].name),
              //             subtitle: Text(
              //                 "${contacts[index].phone} ID:${contacts[index].id.toString()}"),
              //             trailing: IconButton(
              //               onPressed: () {
              //                 // LocalDatabase.updateContact(
              //                 //   contactsModelSql:
              //                 //       contacts[index].copyWith(phone: "123421234"),
              //                 // );
              //                 _updateSingleContact(contacts[index]);
              //                 _updateContacts();
              //               },
              //               icon: const Icon(Icons.edit),
              //             ),
              //             onLongPress: () {
              //               LocalDatabase.deleteContact(contacts[index].id!);
              //               _updateContacts();
              //             },
              //           ),
              //         ),
              //       );
              //     }
              //     return Center(child: Text(rowData.error.toString()));
              //   },
              // ),
            ),
          ],
        ));
  }

  _updateSingleContact(ContactModelSql contactModelSql) {
    final TextEditingController nameController =
        TextEditingController(text: contactModelSql.name);
    final TextEditingController phoneController =
        TextEditingController(text: contactModelSql.phone);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              padding: const EdgeInsets.all(24),
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: "Phone"),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () async {
                        await LocalDatabase.updateContact(
                          contactsModelSql: contactModelSql.copyWith(
                            name: nameController.text,
                            phone: phoneController.text,
                          ),
                        );
                        _updateContacts();
                        Navigator.pop(context);
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          );
        });
  }
}
