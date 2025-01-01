import 'dart:io';
import 'dart:typed_data';
import 'package:campus360/pages/sign_up_page3.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfilePicturePage extends StatefulWidget {
  @override
  _ProfilePicturePageState createState() => _ProfilePicturePageState();
}

class _ProfilePicturePageState extends State<ProfilePicturePage> {
  File? _image; // For mobile
  Uint8List? _webImageBytes; // For web

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        if (kIsWeb) {
          // Web-specific code to read the image as bytes
          final webBytes = await pickedFile.readAsBytes();
          setState(() {
            _webImageBytes = webBytes;
          });
        } else {
          // Mobile-specific code to handle File
          setState(() {
            _image = File(pickedFile.path);
          });
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _goToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(
          webImageBytes: _webImageBytes, // Pass the image for web
          mobileImage: _image, // Pass the image for mobile
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isImageUploaded = _image != null || _webImageBytes != null;

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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _image != null
                              ? FileImage(_image!) // For mobile
                              : (_webImageBytes != null
                              ? MemoryImage(_webImageBytes!) // For web
                              : null),
                          child: _image == null && _webImageBytes == null
                              ? IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.brown,
                            ),
                            onPressed: () {
                              _getImage(ImageSource.camera);
                            },
                          )
                              : null,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Let's start with your profile picture.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _getImage(ImageSource.gallery);
                      },
                      child: Text(
                        "Upload Profile Picture",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: isImageUploaded ? _goToNextPage : null,
                      child: Text("Next"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isImageUploaded ? Colors.green : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
