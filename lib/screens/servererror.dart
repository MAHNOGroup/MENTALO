import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Error UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServerErrorScreen(),
    );
  }
}

class ServerErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Handle the back button action
          },
        ),
        title: Text('ServerErrorScreen'),
        backgroundColor: Colors.teal, // Adjust the color to match your design
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // To make the column wrap its content
            children: <Widget>[
              Image.asset(
                'images/Noconnection.png', // Replace with your asset image path
                width: MediaQuery.of(context).size.width *
                    0.6, // Adjust the image size
              ),
              SizedBox(height: 24),
              Text(
                'Oops, Something Broke!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Something is wrong on our end. Be at ease—we\'re working on it!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle head back action
                },
                child: Text('Head Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // Button background color
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
