import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/products/products_detail_screen.dart';
import 'package:n8_default_project/ui/products/products_screen.dart';

class RouteNames {
  static const String initial = "/";
  static const String products = "/products";
  static const String productDetails = "/product_details";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.products:
        return MaterialPageRoute(builder: (context) {

          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;

          return ProductsScreen(
            prodcuts: map["products"],
            number: map["number"],
          );
        });
      case RouteNames.productDetails:
        return MaterialPageRoute(builder: (context) => ProductsDetailScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}
