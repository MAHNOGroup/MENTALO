import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool emailAlerts = false;
  bool pushNotifications = true;
  bool communityUpdates = true;
  String frequencyOfNotifications = 'real-time';
  bool sound = true;
  bool vibration = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Email Alerts'),
            value: emailAlerts,
            onChanged: (bool value) {
              setState(() {
                emailAlerts = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Push Notifications'),
            value: pushNotifications,
            onChanged: (bool value) {
              setState(() {
                pushNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Community Updates'),
            value: communityUpdates,
            onChanged: (bool value) {
              setState(() {
                communityUpdates = value;
              });
            },
          ),
          Text(
            'Frequency of Notifications',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RadioListTile<String>(
            title: Text('Real-time'),
            value: 'real-time',
            groupValue: frequencyOfNotifications,
            onChanged: (String? value) {
              setState(() {
                frequencyOfNotifications = value ?? '';
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Daily Summaries'),
            value: 'daily',
            groupValue: frequencyOfNotifications,
            onChanged: (String? value) {
              setState(() {
                frequencyOfNotifications = value ?? '';
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Weekly Digests'),
            value: 'weekly',
            groupValue: frequencyOfNotifications,
            onChanged: (String? value) {
              setState(() {
                frequencyOfNotifications = value ?? '';
              });
            },
          ),
          SwitchListTile(
            title: Text('Sound'),
            subtitle: Text(
                'When Sound Notifications are on, your phone will always check for sounds.'),
            value: sound,
            onChanged: (bool value) {
              setState(() {
                sound = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Vibration'),
            subtitle: Text(
                'When Vibration Notifications are on, your phone will vibrate.'),
            value: vibration,
            onChanged: (bool value) {
              setState(() {
                vibration = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
