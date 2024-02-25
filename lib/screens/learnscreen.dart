import 'package:client/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/screens/connectscreen.dart';
import 'package:client/screens/leadershipscreen.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToScreen(int index) {
      switch (index) {
        case 0:
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
          break;
        case 2:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ConnectScreen()));
          break;
        case 3:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LeadershipScreen()));
          break;
        default:
          break; // No action needed if the index is for the current screen
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Text(
              'Balancing Work & Life',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CarouselSlider(
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.network(
                      'https://via.placeholder.com/350x150',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Community Posts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Wellbeing Course'),
            subtitle: Text('Start Now'),
            trailing: Icon(Icons.more_vert),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150')),
            title: Text('Manage Stress'),
            subtitle: Text('Read More'),
            trailing: Icon(Icons.more_vert),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150')),
            title: Text('Wellness Journey'),
            subtitle: Text('Read More'),
            trailing: Icon(Icons.more_vert),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Highlight the 'Learn' icon
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Connect'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Lead'),
        ],
        onTap: _navigateToScreen,
      ),
    );
  }
}
