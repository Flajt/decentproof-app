import 'dart:math';
import 'package:decentproof/firebase_options.dart';
import 'package:decentproof/pages/Integrety/ApiKeyManager.dart';
import 'package:decentproof/pages/Integrety/AppCheckWrapper.dart';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:decentproof/pages/audiopage/AudioPage.dart';
import 'package:decentproof/pages/homepage/HomePage.dart';
import 'package:decentproof/pages/intropage/IntroPage.dart';
import 'package:decentproof/pages/intropage/logic/firstTimeUserCheck.dart';
import 'package:decentproof/pages/settingspage/SettingsPage.dart';
import 'package:decentproof/pages/submissionpage/SubmissionPage.dart';
import 'package:decentproof/pages/verificationpage/VerificationPage.dart';
import 'package:decentproof/pages/videoimagepage/VideoImagePage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  final ApiKeyManager apiKeyManager =
      ApiKeyManager(SecureStorageWrapper(), AppcheckWrapper());
  //used ONLY for appcheck and nothing more
  if (Random().nextInt(2) == 1) await apiKeyManager.updateIfNewKey();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/videoImagePage": (context) => const VideoImagePage(),
        "/audioPage": (context) => const AudioPage(),
        "/submissionPage": (context) => const SubmissionPage(),
        "/verificationPage": (context) => const VerificationPage(),
        "/settingsPage": (context) => const SettingsPage()
      },
      title: 'Decentproof',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.lightGreenAccent,
      ),
      home: FutureBuilder(
          future: isFirstTimeUser(),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return const IntroPage();
            }
            return const HomePage();
          }),
    );
  }
}
