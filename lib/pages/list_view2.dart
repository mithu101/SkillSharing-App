import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var arrName = ["mithu", "noman", "robi", "hatim"];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
        ),
        body: Column(
          children: [
            // First ListView
            SizedBox(
              height: 300, // Constrain height
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      arrName[index],
                      style: TextStyle(fontSize: 21),
                    ),
                  );
                },
                itemCount: arrName.length,
              ),
            ),
            Divider(height: 20, thickness: 2), // Visual separation between ListViews
            // Second ListView
            SizedBox(
              height: 300, // Constrain height
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Text(
                    arrName[index],
                    style: TextStyle(fontSize: 21),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height:80,
                    thickness: 5,
                    color: Colors.deepOrangeAccent,
                  );
                },
                itemCount: arrName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
