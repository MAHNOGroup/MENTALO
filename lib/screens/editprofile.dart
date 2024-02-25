import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfileScreen'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          _buildProfileHeader(),
          _buildTextField(
              label: 'Email Address', placeholder: 'example@gmail.com'),
          _buildTextField(label: 'Full Name', placeholder: 'Noura Brown'),
          _buildTextField(
              label: 'Password', placeholder: '********', isPassword: true),
          _buildTextField(label: 'Date of Birth', placeholder: '02/06/1989'),
          _buildDropdown(label: 'Gender', items: ['Male', 'Female', 'Other']),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save profile action
            },
            child: Text('Save Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/150'), // Replace with actual image URL
        ),
        SizedBox(height: 10),
        Text(
          'Noura Brown',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      {required String label,
      required String placeholder,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: placeholder,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {
                    // Toggle password visibility
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items}) {
    String dropdownValue = items.first;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        value: dropdownValue,
        onChanged: (String? newValue) {
          // Update the state with the new dropdown value
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
