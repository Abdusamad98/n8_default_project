import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routes.dart';
import 'package:n8_default_project/ui/my_contacts/my_contacts_screen.dart';

import 'data/local/storage_repo/storage_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.contacts,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
