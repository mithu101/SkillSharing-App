import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(MyApp());
}

var arrName = ["mithu", "noman", "robi", "hatim","charly","kormy","manu","kanu","sumon","john"];
var arrcity=['dhaka','dhaka','rajshahi','cumilla','barishal','noakhali','sylhet','tangail','gajipur','rangamati'];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
        ),
        body: ListView.separated(itemBuilder: (context, index){
           return ListTile(
             leading: Text('$index',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange)),
             title: Text(arrName[index],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),),
             subtitle: Text(arrcity[index],style: TextStyle(fontSize: 20,color: Colors.blue)),
             trailing: Icon(Icons.account_circle_outlined),
           );
        }, separatorBuilder:(context, index) {
          return Divider(height: 50,thickness: 3);
        }, itemCount: arrName.length)
      ),
    );
  }
}
