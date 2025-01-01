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
          title: Text('Row and Column Example'),
        ),
        body: Column(
          children: [
            // Fixed Row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
            ),

            // Scrollable Column with Mouse Scrolling
            Expanded(
              child: Scrollbar(
                thumbVisibility: true, // Show scrollbar handle
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
