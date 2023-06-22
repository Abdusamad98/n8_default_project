import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routes.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.prodcuts,
    required this.number,
  }) : super(key: key);

  final List<String> prodcuts;
  final int number;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.productDetails,
                    );
                  },
                  child: Text("Navigate"))),
          Expanded(
            child: ListView(
              children: List.generate(
                widget.prodcuts.length,
                (index) => ListTile(
                  title: Text(widget.prodcuts[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
