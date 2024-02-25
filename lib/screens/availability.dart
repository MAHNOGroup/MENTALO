import 'package:flutter/material.dart';

class AvailabilityScreen extends StatefulWidget {
  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  final List<String> _timeOptions = ['15 minutes', '30 minutes', '1 hour'];
  String _selectedTime = '';
  final TextEditingController _otherTimeController = TextEditingController();

  @override
  void dispose() {
    _otherTimeController.dispose();
    super.dispose();
  }

  Widget _buildTimeOption(String time) {
    return ListTile(
      title: Text(time),
      leading: _selectedTime == time
          ? Image.asset('images/Checkmark.png', width: 24, height: 24)
          : null, // No leading widget when not selected
      onTap: () {
        setState(() {
          _selectedTime = time;
          // Clear the "Other" field when a predefined time is selected
          _otherTimeController.clear();
        });
      },
      tileColor: _selectedTime == time ? Colors.green.withOpacity(0.2) : null,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Availability'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'How much time can you dedicate to your well-being each day?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 24),
            ..._timeOptions.map((time) => _buildTimeOption(time)).toList(),
            ListTile(
              title: TextField(
                controller: _otherTimeController,
                decoration: InputDecoration(
                  hintText: 'Other? (Click to write)',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  setState(() {
                    _selectedTime = 'Other';
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement continue action
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
