import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40))
                      .animate()
                      .fade(duration: Duration(milliseconds: 1000))
                      .move(begin: Offset(0, 20), end: Offset(0, 0)),
                  SizedBox(height: 10),
                  Text("Welcome to Kingdom of Kukichin", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                      .animate()
                      .fade(duration: Duration(milliseconds: 1300))
                      .move(begin: Offset(0, 20), end: Offset(0, 0)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fade(duration: Duration(milliseconds: 1400)).move(begin: Offset(0, 20), end: Offset(0, 0)),
                      SizedBox(height: 40),
                      Text("Forgot Password?", style: TextStyle(color: Colors.black54))
                          .animate()
                          .fade(duration: Duration(milliseconds: 1500))
                          .move(begin: Offset(0, 20), end: Offset(0, 0)),
                      SizedBox(height: 40),
                      MaterialButton(
                        onPressed: () {
                          // Implement login action
                        },
                        height: 50,
                        color: Colors.lightBlue[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ).animate().fade(duration: Duration(milliseconds: 1600)).move(begin: Offset(0, 20), end: Offset(0, 0)),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          // Navigate to SignUpPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        },
                        height: 50,
                        color: Colors.lightBlue.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ).animate().fade(duration: Duration(milliseconds: 1700)).move(begin: Offset(0, 20), end: Offset(0, 0)),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          // Navigate to AboutUsPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutUsPage()),
                          );
                        },
                        height: 50,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("About Us", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ).animate().fade(duration: Duration(milliseconds: 1700)).move(begin: Offset(0, 20), end: Offset(0, 0)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Sign Up Page (can be customized for other projects)
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Sign Up Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// About Us Page (can be customized for other projects)
class AboutUsPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      "name": "Amio Rashid",
      "role": "Roll_59",
      "image": "assets/amio.png"
    },
    {
      "name": "Mahmud Pakhi Walid",
      "role": "Roll_51",
      "image": "assets/IMG_0020.JPG"
    },
    {
      "name": "Manobendra Bishwas",
      "role": "Roll_35",
      "image": "assets/amio.png"
    },
    {
      "name": "Marufur Rahman Mithu",
      "role": "Roll_19",
      "image": "assets/amio.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          final member = teamMembers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(member["image"]!), // Ensure images are in assets folder
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member["name"]!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        member["role"]!,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
