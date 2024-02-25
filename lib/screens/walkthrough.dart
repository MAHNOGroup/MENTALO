import 'package:flutter/material.dart';
import 'package:client/screens/initialchoicescreen.dart'; // Ensure this import path is correct

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int currentPage = 0;
  final List<String> images = [
    'images/meditating.png',
    'images/discussing.png', // Add more image paths as needed
    'images/calendar.png',
    'images/browser.png',
  ];

  final List<String> texts = [
    'Explore Personalized Wellness\nJourneys Tailored Just For You',
    'Discover Healthy Habits\nTo Improve Your Daily Life',
    'Plan Your Activities\nWith Our Smart Calendar',
    'Browse Your Wellness\nProgress And Achievements',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              images[currentPage],
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Text(
              texts[currentPage],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => _buildPageIndicator(
                    index == currentPage, index == currentPage ? 16.0 : 12.0),
              ),
            ),
            currentPage < images.length - 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentPage++;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 20.0),
                        child: Text('Next', style: TextStyle(fontSize: 18)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shape: StadiumBorder(),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the InitialChoiceScreen when "Let's Begin" is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InitialChoiceScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 20.0),
                        child:
                            Text("Let's Begin", style: TextStyle(fontSize: 18)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive, double size) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}
