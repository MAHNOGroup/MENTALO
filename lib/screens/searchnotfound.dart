import 'package:flutter/material.dart';

class SearchNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).pop(), // Handle the back button action
        ),
        title: Text('SearchNotFoundScreen'),
        backgroundColor:
            Colors.lightBlue, // Adjust the color to match your design
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // To make the column wrap its content
            children: <Widget>[
              Image.asset(
                'images/Noconnection.png', // Replace with your asset image path
                width: MediaQuery.of(context).size.width *
                    0.5, // Adjust the image size
              ),
              SizedBox(height: 24),
              Text(
                'Oops, Nothing Here!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Looks like we hit a dead end. The page you\'re looking for is playing hide and seek.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle guide me back action
                },
                child: Text('Guide Me Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // Button background color
                  onPrimary: Colors.white, // Button text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
