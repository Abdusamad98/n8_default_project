import 'package:flutter/material.dart';


class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
    );
  }
}
