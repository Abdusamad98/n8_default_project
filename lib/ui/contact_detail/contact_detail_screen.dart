import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/models/contact_model/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({
    super.key,
    required this.contactModelSql,
    required this.deleteListener,
  });

  final ContactModelSql contactModelSql;
  final VoidCallback deleteListener;

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Contact Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListTile(
          title: Text(
            widget.contactModelSql.name,
          ),
          subtitle: Text(
            widget.contactModelSql.phone,
          ),
          trailing: IconButton(
            onPressed: () async {
              // await launchUrl(Uri.parse("tel:${widget.contactModelSql.phone}"));
              //await launchUrl(Uri.parse("https://pub.dev/packages/flutter_phone_direct_caller/install"));
              await FlutterPhoneDirectCaller.callNumber(widget.contactModelSql.phone);
            },
            icon: const Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
          leading: IconButton(
            onPressed: () async {
              int deletedId =
                  await LocalDatabase.deleteContact(widget.contactModelSql.id!);
              if (deletedId > 0) {
                widget.deleteListener.call();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
