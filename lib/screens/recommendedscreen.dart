import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecommendedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended for you'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Text(
              'Unlocking Mindfulness',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.network(
                      'https://via.placeholder.com/350x150', // Placeholder image
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Community Posts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                // Placeholder for user icon
                child: Icon(Icons.person),
              ),
              title: Text('Connect & Share'),
              subtitle: Text('Join Discussion'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                // Placeholder for user icon
                child: Icon(Icons.person),
              ),
              title: Text('Manage Stress'),
              subtitle: Text('Read More'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                // Placeholder for user icon
                child: Icon(Icons.person),
              ),
              title: Text('Wellness Webinar'),
              subtitle: Text('Save Your Spot'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          // Bottom navigation bar
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Learn',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Connect',
              ),
              // Add more items if necessary
            ],
          ),
        ],
      ),
    );
  }
}
