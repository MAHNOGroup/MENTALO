import 'package:client/screens/mentalochatbot.dart';
import 'package:client/screens/profilescreen.dart';
import 'package:client/screens/recommendedscreen.dart';
import 'package:client/screens/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/connectscreen.dart';
import 'package:client/screens/leadershipscreen.dart';
import 'package:client/screens/learnscreen.dart';
import 'package:client/screens/notificationscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final String? username;
  const HomeScreen({Key? key, this.username}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Adding a post frame callback to push the SurveyScreen after the build method
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Implement _shouldShowSurvey to determine if the survey should be shown
      _showSurveyScreen();
      //}
    });
  }

  bool _shouldShowSurvey() {
    // TODO: Implement logic to determine if survey should be shown
    // This could involve checking user preferences, app state, etc.
    return true; // For example purposes, always returning true
  }

  void _showSurveyScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SurveyScreen()),
    );
  }

  void _navigateToScreen(int index) {
    Widget screen;
    switch (index) {
      case 1:
        screen = LearnScreen();
        break;
      case 2:
        screen = ConnectScreen();
        break;
      case 3:
        screen = LeadershipScreen();
        break;
      default:
        return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  void _onTap(int index) {
    if (index != _currentIndex) {
      _navigateToScreen(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome ${widget.username ?? 'User'}!'), // Display the username

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome ${widget.username ?? 'User'}!', // Use the username variable here as well
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Quote of the Day\n“You can\'t stop the waves, but you can learn to surf.”',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: const Text('Recommended for you'),
              subtitle: const Text(
                  'Dive into recommendations tailored just for you. From enriching articles to engaging activities, each suggestion is selected to support your well-being journey.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RecommendedScreen()));
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: const Text('Track your Mood'),
              subtitle: const Text('+50% Last Week'),
              trailing: const Icon(Icons.chevron_right),
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.insert_chart, color: Colors.white),
              ),
              onTap: () {},
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: const Text('Embark on Activity'),
              subtitle: const Text('See More'),
              trailing: const Icon(Icons.chevron_right),
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.directions_run, color: Colors.white),
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // foreground
              ),
              child: const Text('See More'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Anything on your mind?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => MentaloChatbotScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Talk to Mentalo'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Leadership',
          ),
        ],
      ),
    );
  }
}
