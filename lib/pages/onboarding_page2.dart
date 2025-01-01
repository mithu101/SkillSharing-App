import 'package:campus360/pages/sign_up_page1.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00008B), // Deep blue
              Colors.deepPurple,// Medium blue
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ready to create your Skill Deals?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 40.0),
              // Sample app preview (replace with actual app preview)
              ElevatedButton(
                onPressed: () {
                  // Handle Create Account button press
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage1()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set background color to orange
                ),
                child: Text('Create Account',style: TextStyle(color: Colors.white),
              ),
              ),
              SizedBox(height: 20.0),
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
      ),
    );
  }
}

