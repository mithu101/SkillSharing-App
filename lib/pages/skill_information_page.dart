import 'dart:io';
import 'dart:typed_data';
import 'package:campus360/pages/skill_grid_page.dart';
import 'package:flutter/material.dart';

class SkillConfirmationPage extends StatelessWidget {
  final String userSkill; // User's skill
  final List<Uint8List>? uploadedWebImages; // List of uploaded web images
  final List<File>? uploadedMobileImages; // List of uploaded mobile images
  final File? mobileProfileImage; // User's profile image (mobile)
  final Uint8List? webProfileImage; // User's profile image (web)

  SkillConfirmationPage({
    required this.userSkill,
    this.uploadedWebImages,
    this.uploadedMobileImages,
    this.mobileProfileImage,
    this.webProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> combinedImages = [
      if (uploadedMobileImages != null) ...uploadedMobileImages!,
      if (uploadedWebImages != null) ...uploadedWebImages!,
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00008B), Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: mobileProfileImage != null
                    ? FileImage(mobileProfileImage!)
                    : (webProfileImage != null
                        ? MemoryImage(webProfileImage!)
                        : null),
              ),

              // Title
              Text(
                "Great!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "This is your first Skill Card on " + '$userSkill',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Scrollable Skill Card Section
              Container(
                height: 300,
                width: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      combinedImages.isNotEmpty ? combinedImages.length : 1,
                  itemBuilder: (context, index) {
                    if (combinedImages.isEmpty) {
                      return Center(
                        child: Text(
                          "No images uploaded yet.",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      );
                    }

                    final image = combinedImages[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white70, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: image is File
                              ? Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Prompt
              SizedBox(
                height: 50,
              ),
              Text(
                "Do you want to offer more skills?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Yes and No Buttons
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the skill addition page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the next step or finish
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SkillSelectionPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
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
