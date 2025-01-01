import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';

import 'skill_page1.dart'; // Import SkillPage1

class NextPage extends StatelessWidget {
  final Uint8List? webImageBytes; // For web
  final File? mobileImage; // For mobile

  // Constructor to receive image
  NextPage({this.webImageBytes, this.mobileImage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController skillController = TextEditingController();

    void _saveUserData() {
      final userSkill = skillController.text;
      if (userSkill.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter your skill!")),
        );
        return;
      }
      // Save logic can be added here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Information saved successfully!"),
        backgroundColor: Colors.green,),
      );
    }

    void _goToSkillPage1(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SkillPage1(
            skillController.text, // Pass the skill text to SkillPage1
            webImageBytes: webImageBytes, // Pass the image for web
            mobileImage: mobileImage, // Pass the image for mobile
          ),
        ),
      );
    }

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
        child: SafeArea(
          child: Stack(
            children: [
              // Back button positioned at the top-left corner
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
              ),
              // Main content centered
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display the uploaded profile picture
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: mobileImage != null
                            ? FileImage(mobileImage!) // For mobile
                            : (webImageBytes != null
                            ? MemoryImage(webImageBytes!) // For web
                            : null),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Looking Good!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'What skill do you want to offer for a Skill Deal?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: skillController,
                          decoration: InputDecoration(
                            hintText: 'Enter your skill',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          maxLength: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _saveUserData();
                           if(!skillController.text.isEmpty)
                           _goToSkillPage1(context); // Pass the context here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text("Save"),
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
