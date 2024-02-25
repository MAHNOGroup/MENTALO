import 'package:flutter/material.dart';
import 'package:client/screens/walkthrough.dart'; // Ensure this path is correct

class WelcomeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color customGreenText = Color(0xFF518265);
    const Color customButtonColor = Color(0xFF398379);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 16.0, right: 16.0, bottom: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo-no-background.png', width: 300),
                const SizedBox(height: 100),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Fira',
                      fontSize: 26,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Welcome to Mentalo, '),
                      TextSpan(
                        text: 'Your Personal Mental Wellness Companion!',
                        style: TextStyle(
                          fontFamily: 'Fira',
                          color: customGreenText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('images/Line2.png'),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Walkthrough screen when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WalkthroughScreen()), // Replace with your WalkthroughScreen widget
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Fira',
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: customButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
