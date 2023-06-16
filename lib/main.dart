import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/splash/splash_screen.dart';

Future<void> main() async {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: false,
      ),
      home: SplashScreen(),
    );
  }
}
