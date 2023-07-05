import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactsScreenAppBar extends StatelessWidget implements PreferredSize {
  const ContactsScreenAppBar(
      {super.key, required this.onSearchTap, required this.onMoreTap});

  final VoidCallback onSearchTap;
  final ValueChanged<int> onMoreTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.white),
      actions: [
        IconButton(
          onPressed: onSearchTap,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        PopupMenuButton<int>(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onSelected: onMoreTap,
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
      title: const Text(
        "My Contacts",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
