import 'package:campus360/pages/sign_up_page2.dart';
import 'package:campus360/pages/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  final String name; // User's name

  WelcomePage({required this.name}); // Constructor to receive the name

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context, listen: false);
    userState.setUserName(name);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00008B), // Deep blue
              Colors.deepPurple, // Medium blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Navigate back
              },
            ),
            SizedBox(height: 40),
            Text(
              'Great to have you here, $name!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We'll help you set up your profile so you can find great skill deals.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Perform any setup logic here
                },
                child: Text(
                  "Let's Do It!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle the skip action
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePicturePage()));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
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
