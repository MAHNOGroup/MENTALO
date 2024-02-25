import 'package:client/screens/home_page.dart';
import 'package:flutter/material.dart';
// Import other screens
import 'package:client/screens/learnscreen.dart';
import 'package:client/screens/leadershipscreen.dart';

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToScreen(int index) {
      Widget screen;
      switch (index) {
        case 0:
          screen = HomeScreen();
          break;
        case 1:
          screen = LearnScreen();
          break;
        case 3:
          screen = LeadershipScreen();
          break;
        default:
          return; // Stay on the current screen if it's already ConnectScreen
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => screen),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20.0),
          Image.asset('assets/your_image_asset.png', height: 200),
          const SizedBox(height: 20.0),
          const Text(
            'Welcome to Our Community !',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'A safe place where you can feel at home.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Image.asset('assets/mentalo_logo.png', height: 100),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
            child: const Text('Join us now'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Terms of Use'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Highlight the 'Connect' icon
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Lead',
          ),
        ],
        onTap: (index) {
          _navigateToScreen(index);
        },
      ),
    );
  }
}
