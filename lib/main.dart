import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routes.dart';

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
        // useMaterial3: true,
      ),
      // home: HomeScreen(),
      initialRoute: RouteNames.initial,
      // routes: {
      //   AppRoutes.initial: (context) => HomeScreen(),
      //   AppRoutes.products: (context) => ProductsScreen(),
      //   AppRoutes.productDetails: (context) => ProductsDetailScreen(),
      // },
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
