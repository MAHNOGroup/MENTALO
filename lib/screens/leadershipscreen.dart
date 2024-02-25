import 'package:client/screens/home_page.dart';
import 'package:flutter/material.dart';
// Make sure to import your actual screens here
import 'package:client/screens/learnscreen.dart';
import 'package:client/screens/connectscreen.dart';

class LeadershipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToScreen(int index) {
      switch (index) {
        case 0:
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
          break;
        case 1:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LearnScreen()));
          break;
        case 2:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ConnectScreen()));
          break;
        // No need for a case for index 3 since we are already on the LeadershipScreen
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leadership'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top 10 Global Ranks',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You are on Top 2, Congrats!\nKeep up the good work.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.star,
                    color: index < 3 ? Colors.orange : Colors.grey),
                title: Text(
                  [
                    "Tom Waterson",
                    "Noura Brown",
                    "Emilia Sprouse",
                    "Richard Palvin",
                    "Adam Smith",
                    "Nicole Lopez",
                    "Mariam Dion",
                    "Lina Pitt",
                    "Anais Waterson",
                    "Salma Bulat"
                  ][index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text('${index + 1}',
                    style: TextStyle(color: Colors.grey[600])),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Highlight the leadership icon
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Connect'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'Leadership'),
        ],
        onTap: (index) {
          _navigateToScreen(index);
        },
      ),
    );
  }
}
