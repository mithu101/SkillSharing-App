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
        body: Column(
          children: [
            // Horizontal ListView
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: 200,
                    color: Colors.orange,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: 200,
                    color: Colors.amber,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: 200,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            // Vertical ListView
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.brown,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.redAccent,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
