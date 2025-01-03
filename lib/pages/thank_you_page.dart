import 'package:campus360/pages/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);
    final String userName = userState.userName;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade800, Colors.orange.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up_alt_rounded,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you $userName!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'You are all set now!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page or handle button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Find Skill Deals',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
