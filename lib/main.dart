import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/list_view_builder.dart';
import 'package:n8_default_project/ui/simple_list.dart';
import 'package:n8_default_project/ui/sliver_list_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CustomScrollViewExampleApp(),
    );
  }
}

