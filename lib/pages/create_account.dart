import 'package:campus360/pages/sign_up_page1.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF001F54), // Dark blue
              Color(0xFF007BFF), // Light blue
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Ready to create your Skill Deals?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Centered phone image
            Image.asset(
              'assets/images/mockup_phone.png', // Replace with your actual image path
              width: 250.0,
            ),
            const SizedBox(height: 50.0),
            // "Create Account" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press (e.g., navigate to signup page)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage1()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7A00), // Orange color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Footer text with login link
            GestureDetector(
              onTap: () {
                // Handle login tap
              },
              child: const Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF7A00), // Orange color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


