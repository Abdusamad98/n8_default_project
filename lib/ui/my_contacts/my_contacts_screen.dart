import 'package:flutter/material.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/ui/app_routes.dart';
import 'package:n8_default_project/ui/my_contacts/widgets/contacts_screen_appbar.dart';
import 'package:n8_default_project/ui/my_contacts/widgets/contact_search_view.dart';

import '../../models/contact_model/contact_model.dart';

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
      appBar: ContactsScreenAppBar(
        onSearchTap: () async {
          searchText = await showSearch(
            context: context,
            delegate: ContactSearchView(
              suggestionList: allContacts.map((e) => e.name).toList(),
            ),
          );
          if (searchText.isNotEmpty) _getContactsByQuery(searchText);
          print("RESULT:$searchText");
        },
        onMoreTap: (int item) {
          setState(() {
            selectedMenu = item;
          });
          if (selectedMenu == 1) {
          } else {
            _getContactsByAlp(selectedMenu == 2 ? "ASC" : "DESC");
          }
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(
                contacts.length,
                (index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.contactDetails,
                        arguments: {
                          "contactModelSql": contacts[index],
                          "deleteListener": () {
                            _updateContacts();
                          }
                        });
                  },
                  leading: const Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.addContact, arguments: () {
            _updateContacts();
            print("Hoy contact qo'shildi screenni update qilish kk");
          });
        },
      ),
    );
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
