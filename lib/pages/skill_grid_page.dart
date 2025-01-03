import 'package:flutter/material.dart';
import 'skill_profile_page.dart'; // Import the ProfilePage

class SkillSelectionPage extends StatefulWidget {
  @override
  _SkillSelectionPageState createState() => _SkillSelectionPageState();
}

class _SkillSelectionPageState extends State<SkillSelectionPage> {
  // List to store selected skills
  final List<String> _selectedSkills = [];

  // Skill data (cleaned up duplicates)
  final List<Map<String, dynamic>> _skills = [
    {'name': 'Arts', 'icon': Icons.palette},
    {'name': 'Crafts', 'icon': Icons.build},
    {'name': 'Food', 'icon': Icons.restaurant},
    {'name': 'Gardening', 'icon': Icons.nature_people},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
    {'name': 'Coding', 'icon': Icons.code},
    {'name': 'Public Speaking', 'icon': Icons.mic},
    {'name': 'Household', 'icon': Icons.home},
    {'name': 'Technology', 'icon': Icons.laptop},
    {'name': 'Language', 'icon': Icons.language},
    {'name': 'Mental Health', 'icon': Icons.mood},
    {'name': 'Cooking', 'icon': Icons.kitchen},
    {'name': 'Mobility', 'icon': Icons.directions_car},
    {'name': 'Music', 'icon': Icons.music_note},
    {'name': 'Fitness', 'icon': Icons.fitness_center},
    {'name': 'Teaching', 'icon': Icons.school},
    {'name': 'Writing', 'icon': Icons.edit},
    {'name': 'Photography', 'icon': Icons.camera_alt},
    {'name': 'Design', 'icon': Icons.design_services},
    {'name': 'Babysitting', 'icon': Icons.child_care},
    {'name': 'Driving', 'icon': Icons.directions_car_filled},
  ];

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
          child: Column(
            children: [
              // Back Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),

              // Title
              Text(
                "Which skill areas would you \n like to make deals with",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),

              // GridView
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: _skills.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) {
                      final skill = _skills[index];
                      final isSelected =
                          _selectedSkills.contains(skill['name']);
                      return _buildSkillButton(
                        skill['name']!,
                        skill['icon'] as IconData,
                        isSelected,
                      );
                    },
                  ),
                ),
              ),

              // Bottom Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          selectedSkills: _selectedSkills,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Set Wanted Skill',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillButton(String skillName, IconData icon, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            _selectedSkills.remove(skillName);
          } else {
            _selectedSkills.add(skillName);
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.blueGrey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0, color: Colors.white),
          SizedBox(height: 8.0),
          Text(
            skillName,
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
