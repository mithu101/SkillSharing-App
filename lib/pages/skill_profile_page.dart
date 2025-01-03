import 'package:campus360/pages/thank_you_page.dart';
import 'package:campus360/pages/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final List<String> selectedSkills;

  ProfilePage({required this.selectedSkills});

  @override
  Widget build(BuildContext context) {
    // Access the UserState using Provider
    final userState = Provider.of<UserState>(context);
    final String name = userState.userName;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00008B), Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
              SizedBox(height: 16.0),

              // Title and Intro
              Text(
                'Great Job, $name!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'This is your profile:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),

              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: userState.mobileImage != null
                      ? FileImage(userState.mobileImage!)
                      : (userState.webImageBytes != null
                          ? MemoryImage(userState.webImageBytes!)
                          : AssetImage(
                              'assets/images/profile_image.png', // Default image
                            ) as ImageProvider),
                ),
              ),
              SizedBox(height: 50.0),

              Text(
                "My offered Skill:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: Text(
                    userState.userSkill,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              // Wanted Skills
              SizedBox(height: 50.0),
              Text(
                "Skills you're looking for:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: selectedSkills
                        .map(
                          (skill) => Chip(
                            label: Text(
                              skill,
                              style: TextStyle(fontSize: 15),
                            ),
                            backgroundColor: Colors.blueGrey.shade100,
                            shadowColor: Colors.blueAccent,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThankYouPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
