import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List view Example'),
        ),
        body: Card(
          elevation: 10,
          shadowColor: Colors.brown,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Hello world"),
          ),
        )
      ),
    );
  }
}
