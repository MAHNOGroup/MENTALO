import 'package:flutter/material.dart';

class AccountInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            const ListTile(
              title: Text('Full Name'),
              subtitle: Text('Noura Brown'),
            ),
            const ListTile(
              title: Text('Email Address'),
              subtitle: Text('example@gmail.com'),
            ),
            const ListTile(
              title: Text('Date of Birth'),
              subtitle: Text('02/06/1999'),
            ),
            const ListTile(
              title: Text('Gender'),
              subtitle: Text('Female'),
            ),
            const ListTile(
              title: Text('Joined in'),
              subtitle: Text('October 6th, 2023'),
            ),
          ],
        ).toList(),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AccountInformationScreen()));
