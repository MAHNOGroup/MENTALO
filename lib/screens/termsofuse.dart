import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Mentalo app.\n'
                'These Terms of Use govern your access to and use of Mentalo and its related services. '
                'By accessing or using the app, you agree to be bound by these terms.\n\n'
                '• You must be at least 18 years old to use Mentalo. By using Mentalo, you affirm that '
                'you meet this age requirement.\n'
                '• You are responsible for maintaining the confidentiality of your account credentials '
                'and for all activities under your account. You agree to notify us immediately of any '
                'unauthorized use of your account.\n'
                '• You retain all your rights to any content you submit, post, or display on or through '
                'Mentalo. You grant Mentalo a non-exclusive license to use, reproduce, and distribute '
                'such content.\n'
                '• Mentalo reserves the right to modify or discontinue, temporarily or permanently, '
                'the service (or any part thereof) with or without notice.\n'
                '• Mentalo shall not be liable for any indirect, incidental, special, consequential, or '
                'punitive damages, including without limitation, loss of profits, data, or other '
                'intangibles.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
