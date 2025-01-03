import 'package:campus360/pages/input.dart';
import 'package:campus360/pages/sign_up_page1.dart';
import 'package:campus360/pages/sign_up_page2.dart';
import 'package:campus360/pages/skill_grid_page.dart';
import 'package:campus360/pages/splash_page.dart';
import 'package:campus360/pages/splash_screen.dart';
import 'package:campus360/pages/user_state.dart';
import 'package:flutter/material.dart';
import 'package:campus360/pages/onboarding_page1.dart';
import 'package:provider/provider.dart';
// Ensure this path is correct

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Colors.deepPurple, // Light blue
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Find people who got\nskills where you need help.',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40.0),
              Center(
                child: Image.asset(
                  'assets/images/box7_image.jpg',
                  width: 250.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0
                          ? Colors.black
                          : Colors.white, // First dot black, others white
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingPage1(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Skip'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
