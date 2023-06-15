import 'package:flutter/material.dart';

class NewWidgetExample extends StatefulWidget {
  const NewWidgetExample({Key? key}) : super(key: key);

  @override
  State<NewWidgetExample> createState() => _NewWidgetExampleState();
}

class _NewWidgetExampleState extends State<NewWidgetExample> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expension example"),),
      body: Column(
        children: [
          const ExpansionTile(
            title: Text('ExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              ListTile(title: Text('This is tile number 1',style: TextStyle(color: Colors.red),),),
              ListTile(title: Text('This is tile number 1',style: TextStyle(color: Colors.red),),),
            ],
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          const ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
        ],
      ),
    );
  }
}
