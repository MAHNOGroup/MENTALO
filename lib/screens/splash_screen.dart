import 'dart:async';
import 'package:client/screens/welcome_component.dart';
import 'package:flutter/material.dart';
import 'home_page.dart'; // Adjust this import according to your file structure.

class SplashScreen extends StatefulWidget {
  final double lineImageHeight;
  final double lineImageWidth;
  final double logoImageWidth;
  final EdgeInsetsGeometry imagePadding;
  final double
      logoVerticalOffset; // Added to control the vertical position of the logo

  SplashScreen({
    this.lineImageHeight = 300.0, // Default height for Line2.png
    this.lineImageWidth =
        1000.0, // Default width for Line2.png, taking full width
    this.logoImageWidth = 300.0, // Default width for the logo
    this.imagePadding =
        const EdgeInsets.all(0), // Default padding for the images
    this.logoVerticalOffset = 0.0, // Default vertical offset for the logo
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
            seconds: 5), // Assuming a more practical duration than 1000 seconds
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomeComponent())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: widget.imagePadding,
            child: Image.asset(
              'images/Line2.png',
              height: widget.lineImageHeight,
              width: widget.lineImageWidth,
            ), // The Line2.png image with configurable height and width
          ),
          SizedBox(
              height: widget
                  .logoVerticalOffset), // Use the vertical offset to move the logo up
          Image.asset(
            'images/logo-no-background.png',
            width: widget.logoImageWidth,
            // The logo image with configurable width
          ),
        ],
      ),
    );
  }
}
