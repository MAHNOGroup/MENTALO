import 'package:flutter/material.dart';

class NoInternetErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('NoInternetErrorScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/Noconnection.png', // Replace with your asset image
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Disconnected!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'It looks like the internet connection has taken a break.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('Try to refresh'),
              onPressed: () {
                // Handle refresh action
              },
            ),
            ElevatedButton(
              child: Text('Attempt Reconnect'),
              onPressed: () {
                // Handle reconnect action
              },
            ),
          ],
        ),
      ),
    );
  }
}
