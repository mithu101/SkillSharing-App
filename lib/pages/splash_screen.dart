import 'dart:async';

import 'package:campus360/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => HomePage(),
          )
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.green,
        child: Center(
            child: FaIcon(FontAwesomeIcons. amazon, color: Colors.orange,
              size: 40,
            )
        ),
      )
    );
  }
}
