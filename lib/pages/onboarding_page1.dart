import 'package:campus360/pages/onboarding_page2.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top Text
              Text(
                'Offer your own skills in return\nand create a Skill Deal to help\neach other.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.0),

              // Phone Frames
              Container(
                child: Image.asset(
                  'assets/images/skill3.jpg', // Replace with your actual image path
                  width: 250.0,
                ),
              ),

              SizedBox(height: 40.0),

              // Bottom Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 1 ?   Colors.black : Colors.white, // First dot black, others white
                    ),
                  );
                }),
              ),


              SizedBox(height: 20.0),

              // Skip Button
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle "Skip" button press
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>OnboardingPage2()
                        )
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions for reusable UI elements
  Widget _buildPhoneFrame({required String imagePath}) {
    return Container(
      width: 150.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}