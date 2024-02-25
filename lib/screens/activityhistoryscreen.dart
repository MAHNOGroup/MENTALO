import 'package:flutter/material.dart';

class ActivityHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Activity History Screen'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Monthly Wellness Stats',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'December Statistics',
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            const Text(
              '1,245 Activities',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
                'assets/chart_placeholder.png'), // Replace with your asset
            const SizedBox(height: 20),
            DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  const TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Top Activities'),
                      Tab(text: 'Personal Goals Progress'),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      children: [
                        _buildTopActivities(),
                        _buildPersonalGoalsProgress(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopActivities() {
    // Replace with your data and widgets
    return ListView(
      children: const [
        ListTile(
          title: Text('Mindfulness Meditation'),
          subtitle: Text('Most Engaged Activity'),
          trailing: Text('80%'),
        ),
        ListTile(
          title: Text('Yoga Practice'),
          subtitle: Text('Improved Flexibility'),
          trailing: Text('60%'),
        ),
      ],
    );
  }

  Widget _buildPersonalGoalsProgress() {
    // Replace with your data and widgets
    return ListView(
      children: const [
        ListTile(
          title: Text('Sleep Quality'),
          subtitle:
              Text('Achieved your sleep goals on 80% of nights this month.'),
          trailing: Text('35%'),
        ),
        ListTile(
          title: Text('Daily Steps'),
          subtitle: Text('Reached 10k steps on 90% of days'),
          trailing: Text('90%'),
        ),
      ],
    );
  }
}
