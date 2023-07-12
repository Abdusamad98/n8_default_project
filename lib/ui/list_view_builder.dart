import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: ListView.builder(
        itemCount: 21,
        itemBuilder: (BuildContext context, index) {
          switch (index) {
            case 0:
              return Container(color: Colors.tealAccent, height: 200);
            case 10:
              return Container(color: Colors.red, height: 200);
            case 20:
              return const Center(child: CircularProgressIndicator());
            // default: return const Text("Hi");
          }
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text("Title:$index"),
              ),
              ListTile(
                title: Text("Subtitle:$index"),
              )
            ],
          );
        },
      ),
    );
  }
}
