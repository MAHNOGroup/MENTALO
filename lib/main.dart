import 'package:client/screens/adminsurveyscreen.dart';
import 'package:client/screens/availability.dart';
import 'package:client/screens/chathistoryscreen.dart';
import 'package:client/screens/editprofile.dart';
import 'package:client/screens/experiencelvl.dart';
import 'package:client/screens/finalpreference.dart';
import 'package:client/screens/goalsetting_screen.dart';
import 'package:client/screens/home_page.dart';
import 'package:client/screens/initialchoicescreen.dart';
import 'package:client/screens/learnscreen.dart';
import 'package:client/screens/maintenancescreen.dart';
import 'package:client/screens/mentalochat.dart';
import 'package:client/screens/mentalochatbot.dart';
import 'package:client/screens/new_password.dart';
import 'package:client/screens/nointerneterror.dart';
import 'package:client/screens/notificationscreen.dart';
import 'package:client/screens/notificationsetting.dart';
import 'package:client/screens/preferenceinterest.dart';
import 'package:client/screens/profilescreen.dart';
import 'package:client/screens/recommendedscreen.dart';
import 'package:client/screens/reset_password.dart';
import 'package:client/screens/screensearch.dart';
import 'package:client/screens/searchnotfound.dart';
import 'package:client/screens/servererror.dart';
import 'package:client/screens/settingscreen.dart';
import 'package:client/screens/signin.dart';
import 'package:client/screens/signup.dart';
import 'package:client/screens/splash_screen.dart';
import 'package:client/screens/submitfeedback.dart';
import 'package:client/screens/survey_question.dart';
import 'package:client/screens/survey_screen.dart';
import 'package:client/screens/surveycompletion.dart';
import 'package:client/screens/walkthrough.dart';
import 'package:client/screens/welcome_component.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // This is correct
  await Firebase.initializeApp(
    // Add 'await' here
    options: const FirebaseOptions(
      apiKey: "AIzaSyB6BanvL5XT4ov_zp9MpeDaXbH3MHjTf6E",
      appId: "1:124612766079:android:58cf5a136c6528a716d24a",
      messagingSenderId: "124612766079",
      projectId: "mentalo-app",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Use the custom font for the entire app
        fontFamily: 'Fira',
      ),
      home: AdminSurveysScreen(),
    );
  }
}
