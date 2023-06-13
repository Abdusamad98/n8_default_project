import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Deafult screen"),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  controller: scrollController,
                  itemCount: 1000,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Center(child: Text("Text $index")));
                  })),
          ElevatedButton(
            onPressed: () {
              setState(() {
                scrollController.position.animateTo(
                  400,
                  duration: Duration(seconds: 2),
                  curve: Curves.linear,
                );
              });
            },
            child: Text("Button"),
          ),
        ],
      ),
    );
  }
}
