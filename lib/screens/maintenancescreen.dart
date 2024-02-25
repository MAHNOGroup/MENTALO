import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Correctly handle the back arrow action
          },
        ),
        title: Text('Maintenance Screen'),
        backgroundColor: Colors.green, // Adjust the color to match your design
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/Noconnection.png', // Replace with your asset image path
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust the image size
            ),
            SizedBox(height: 24),
            Text(
              'Tuning Up!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'We are doing some minor improvements. Thank you for your patience!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle return later action
              },
              child: Text('Return Later'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent, // Button background color
                onPrimary: Colors.white, // Button text color
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle check in action
              },
              child: Text('Check in after 7h 15min'),
            ),
          ],
        ),
      ),
    );
  }
}
