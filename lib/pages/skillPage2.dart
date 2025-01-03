import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'skill_information_page.dart'; // Import the confirmation page

class SkillPage2 extends StatefulWidget {
  final String userSkill;
  final Uint8List? webImageBytes;
  final File? mobileImage;

  SkillPage2({
    required this.userSkill,
    this.webImageBytes,
    this.mobileImage,
  });

  @override
  _SkillPage2State createState() => _SkillPage2State();
}

class _SkillPage2State extends State<SkillPage2> {
  List<File> _uploadedImages = []; // For mobile images
  List<Uint8List> _uploadedWebImages = []; // For web images

  // Image picker function for mobile and web
  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        if (kIsWeb) {
          final webBytes = await pickedFile.readAsBytes();
          setState(() {
            _uploadedWebImages.add(webBytes);
          });
        } else {
          setState(() {
            _uploadedImages.add(File(pickedFile.path));
          });
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _goToSkillConfirmationPage(BuildContext context) {
    if (_uploadedImages.isEmpty && _uploadedWebImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload an image or skip.')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SkillConfirmationPage(
            userSkill: widget.userSkill,
            uploadedWebImages: _uploadedWebImages,
            uploadedMobileImages: _uploadedImages,
            mobileProfileImage: widget.mobileImage,
            webProfileImage: widget.webImageBytes,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: widget.mobileImage != null
                          ? FileImage(widget.mobileImage!)
                          : (widget.webImageBytes != null
                              ? MemoryImage(widget.webImageBytes!)
                              : null),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        widget.userSkill,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Do you have a picture of your skill?",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _uploadedImages.length + _uploadedWebImages.length,
                        itemBuilder: (context, index) {
                          if (index < _uploadedImages.length) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _uploadedImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            int webIndex = index - _uploadedImages.length;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    _uploadedWebImages[webIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        _getImage(ImageSource.gallery);
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
                        "Upload Skill Picture",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _goToSkillConfirmationPage(context);
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
                        "Next",
                        style: TextStyle(fontSize: 16, color: Colors.black),
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
