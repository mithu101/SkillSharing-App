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
        body: Container(
          height: 700,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('A', style: TextStyle(fontSize: 23)),
                  Text('B', style: TextStyle(fontSize: 23)),
                  Text('C', style: TextStyle(fontSize: 23)),
                  Text('D', style: TextStyle(fontSize: 23)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                    ),
                    onPressed: () {
                      // Add your button functionality here
                    },
                    child: Text("Click me", style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('a', style: TextStyle(fontSize: 23)),
                  Text('b', style: TextStyle(fontSize: 23)),
                  Text('c', style: TextStyle(fontSize: 23)),
                  Text('d', style: TextStyle(fontSize: 23)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button color
                    ),
                    onPressed: () {
                      print('clicked btn');
                    },
                    child: Text("btn"),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('c1', style: TextStyle(fontSize: 23)),
                  Text('c2', style: TextStyle(fontSize: 23)),
                  Text('c3', style: TextStyle(fontSize: 23)),
                  Text('c4', style: TextStyle(fontSize: 23)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Button color
                    ),
                    onPressed: () {
                      // Add your button functionality here
                    },
                    child: Text("Click me"),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.brown,
                      padding: EdgeInsets.all(20), // Added padding for text
                      child: Text(
                        'hello my banc my country',
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      padding: EdgeInsets.all(1), // Optional: Add padding
                      color: Colors.greenAccent, // Background color
                      child: Text(
                        'This is a sample. '
                            'Flutter makes. '
                            'You can cust.',
                        style: TextStyle(
                          fontSize: 16, // Text size
                          color: Colors.black, // Text color
                        ),
                        textAlign: TextAlign.justify, // Align text (e.g., justify, center)
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('tapped');
                      },
                      onDoubleTap: () {
                        print('double tapped');
                      },
                      onLongPress: () {
                        print('long pressed');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                        child: Center(
                            child: InkWell(
                              onTap: (){
                                print("clicked the hello");
                              },
                              child: Text('Hello',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold, color: Colors.black)
                              ),
                            )
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
