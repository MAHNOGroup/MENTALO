import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessibilitySettingsScreen extends StatefulWidget {
  @override
  _AccessibilitySettingsScreenState createState() =>
      _AccessibilitySettingsScreenState();
}

class _AccessibilitySettingsScreenState
    extends State<AccessibilitySettingsScreen> {
  double _textScaleFactor = 1.0;
  bool _soundEnabled = false;
  bool _colorBlindModeEnabled = false;
  bool _highContrastEnabled = false;
  bool _screenReaderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Text Size'),
            subtitle: Slider(
              value: _textScaleFactor,
              min: 0.8,
              max: 1.2,
              divisions: 4,
              label: _textScaleFactor.toString(),
              onChanged: (double value) {
                setState(() {
                  _textScaleFactor = value;
                });
                // You might want to store the value in a state management solution
              },
            ),
            trailing: Text(
              _textScaleFactor.toStringAsFixed(2),
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
          ),
          SwitchListTile(
            title: const Text('Sound'),
            subtitle: const Text(
                'Adjust sound settings for notifications and alerts.'),
            value: _soundEnabled,
            onChanged: (bool value) {
              setState(() {
                _soundEnabled = value;
              });
              // You might want to store the value in a state management solution
            },
          ),
          SwitchListTile(
            title: const Text('Color Blind Mode'),
            subtitle: const Text(
                'Optimize color schemes for color vision deficiencies.'),
            value: _colorBlindModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _colorBlindModeEnabled = value;
              });
              // You might want to store the value in a state management solution
            },
          ),
          SwitchListTile(
            title: const Text('Contrast'),
            subtitle: const Text(
                'Increase the contrast to make text and images easier to see.'),
            value: _highContrastEnabled,
            onChanged: (bool value) {
              setState(() {
                _highContrastEnabled = value;
              });
              // You might want to store the value in a state management solution
            },
          ),
          SwitchListTile(
            title: const Text('Screen Reader Support'),
            subtitle: const Text(
                'Enable support for screen readers to assist with navigation and reading content.'),
            value: _screenReaderEnabled,
            onChanged: (bool value) {
              setState(() {
                _screenReaderEnabled = value;
              });
              // You might want to store the value in a state management solution
            },
          ),
        ],
      ),
    );
  }
}
