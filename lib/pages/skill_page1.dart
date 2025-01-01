import 'dart:io';
import 'dart:typed_data';
import 'package:campus360/pages/skillPage2.dart';
import 'package:flutter/material.dart';

class SkillPage1 extends StatelessWidget {
  final Uint8List? webImageBytes; // For web
  final File? mobileImage;
  final String userSkill; // User skill

  // Constructor to receive image and skill
  SkillPage1(this.userSkill, {this.webImageBytes, this.mobileImage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController skillInfoController = TextEditingController();

    void _saveUserData() {
      final userSkillInfo = skillInfoController.text;
      if (userSkillInfo.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please write something about '$userSkill'!"),
          ),
        );
        return;
      }
      // Save logic can be added here, for now just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Information saved successfully!",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }

    void _goToSkillPage2(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SkillPage2(
            userSkill: userSkill,             // Pass skill name
            webImageBytes: webImageBytes,     // Pass image for web
            mobileImage: mobileImage,         // Pass image for mobile
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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile picture
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
                    // Skill label
                    Text(
                      "My offered skills:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Skill button
                    ElevatedButton(
                      onPressed: () {
                        // Handle skill selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7849F7), // Purple button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '$userSkill',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Description text field
                    Container(
                      width: 300, // Adjust width as needed
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2B40), // Darker blue background for text field
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: skillInfoController,
                        style: TextStyle(color: Colors.white),
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Tell other users a little bit about your skill.",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Save button
                    ElevatedButton(
                      onPressed: () {
                        // Save the skill and description
                        _saveUserData();
                        if(!skillInfoController.text.isEmpty){
                          _goToSkillPage2(context); // Go to the next page after saving
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF7931E), // Orange button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
