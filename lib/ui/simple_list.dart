import 'package:flutter/material.dart';

class SimpleListScreen extends StatefulWidget {
  const SimpleListScreen({Key? key}) : super(key: key);

  @override
  State<SimpleListScreen> createState() => _SimpleListScreenState();
}

class _SimpleListScreenState extends State<SimpleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple List"),
      ),
      body: Scrollbar(
        radius: const Radius.circular(10),
        thickness: 30,
        trackVisibility: true,
        child: ListView(
          children: [
            Container(height: 200, color: Colors.green),
            Container(height: 200, color: Colors.red),
            Container(height: 200, color: Colors.yellow),
            for (int i = 0; i < 5; i++) Container(height: 200, color: Colors.red),
            ...List.generate(
                5, (index) => Container(height: 200, color: Colors.yellow)),

            for (int i = 0; i < 5; i++)
              ListView(
                physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(height: 200, color: Colors.brown),
                Container(height: 200, color: Colors.black),
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView(
               // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(height: 200, color: Colors.white),
                  Container(height: 200, color: Colors.tealAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
