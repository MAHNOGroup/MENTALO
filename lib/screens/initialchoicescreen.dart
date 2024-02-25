import 'package:client/screens/signin.dart';
import 'package:client/screens/signup.dart';
import 'package:flutter/material.dart';

class InitialChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // This makes the content scrollable
        child: Padding(
          padding: EdgeInsets.all(36.0), // Increased padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.1), // Added space at the top
              Image.asset(
                'images/newuser.png', // Replace with your asset image path
                width: MediaQuery.of(context).size.width *
                    0.8, // Increased image width
              ),
              SizedBox(height: 36), // Increased spacing
              Text(
                'Join our supportive community. Sign up or log in to stay on the path to mental well-being',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 36), // Increased spacing
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 60),
                ),
              ),

              SizedBox(height: 24),

              OutlinedButton(
                onPressed: () {
                  // Navigate to the SignInScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  minimumSize: Size(double.infinity, 60),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.1), // Added space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
