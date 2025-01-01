import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var userName = TextEditingController();
var userPass = TextEditingController();
var userMobile = TextEditingController();

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  TextField(
                    controller: userName,
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.account_circle, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: userPass,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Add functionality to toggle password visibility
                        },
                        icon: Icon(Icons.remove_red_eye, color: Colors.green),
                      ),
                      prefixIcon: Icon(Icons.password, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: userMobile,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter mobile number',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.phone, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = userName.text.trim();
                      String pass = userPass.text.trim();
                      String mobile = userMobile.text.trim();
                      print("Name: $name, Password: $pass, Mobile: $mobile");
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  FaIcon(
                    FontAwesomeIcons.amazon,
                    size: 40,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  