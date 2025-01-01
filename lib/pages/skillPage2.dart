import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SkillPage2 extends StatefulWidget {
  final String userSkill;
  final Uint8List? webImageBytes;
  final File? mobileImage;

  // Named constructor for receiving parameters
  SkillPage2({
    required this.userSkill, // Required parameter
    this.webImageBytes,      // Optional parameter for web image
    this.mobileImage,        // Optional parameter for mobile image
  });

  @override
  _SkillPage2State createState() => _SkillPage2State();
}

class _SkillPage2State extends State<SkillPage2> {
  List<File> _uploadedImages = []; // List to store mobile uploaded images
  List<Uint8List> _uploadedWebImages = []; // List to store web uploaded images

  // Image picker function for mobile and web
  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        if (kIsWeb) {
          // Web-specific code to read the image as bytes
          final webBytes = await pickedFile.readAsBytes();
          setState(() {
            _uploadedWebImages.add(webBytes); // Add web image to the list
          });
        } else {
          // Mobile-specific code to handle File
          setState(() {
            _uploadedImages.add(File(pickedFile.path)); // Add mobile image to the list
          });
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              // Content in the center
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    // Profile Picture (Always shows profile image)
                    CircleAvatar(
                      radius: 60,

                      backgroundColor: Colors.grey[300],
                      backgroundImage: widget.mobileImage != null
                          ? FileImage(widget.mobileImage!) // For mobile
                          : (widget.webImageBytes != null
                          ? MemoryImage(widget.webImageBytes!) // For web
                          : null),
                    ),
                    SizedBox(height: 20),
                    // Skill Name
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        widget.userSkill, // Display the passed skill name
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Prompt Text
                    Text(
                      "Do you have a picture of your skill?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),
                    // Show uploaded skill images as a scrollable list
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(horizontal: 20), // Add padding for the list

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,

                          itemCount: _uploadedImages.length + _uploadedWebImages.length,
                          itemBuilder: (context, index) {
                            if (index < _uploadedImages.length) {
                              // For mobile images
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200, // Fixed width for each image container
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                    border: Border.all(color: Colors.orange), // Border color
                                    color: Colors.white, // Background color for empty space
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _uploadedImages[index], // Show uploaded mobile image
                                      fit: BoxFit.cover, // Ensure the image fits within the bounds
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // For web images
                              int webIndex = index - _uploadedImages.length;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200, // Fixed width for each image container
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                    border: Border.all(color: Colors.orange), // Border color
                                    color: Colors.white, // Background color for empty space
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.memory(
                                      _uploadedWebImages[webIndex], // Show uploaded web image
                                      fit: BoxFit.cover   , // Ensure the image fits within the bounds
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),

                    SizedBox(height: 40),
                    // Upload Skill Picture Button
                    ElevatedButton(
                      onPressed: () {
                        _getImage(ImageSource.gallery); // Trigger image selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        "Upload Skill Picture",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    // Skip Button
                    TextButton(
                      onPressed: () {
                        // Implement skip functionality here
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
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
