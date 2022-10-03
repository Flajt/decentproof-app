import 'package:decentproof/firebase_options.dart';
import 'package:decentproof/pages/audiopage/AudioPage.dart';
import 'package:decentproof/pages/homepage/HomePage.dart';
import 'package:decentproof/pages/settingspage/SettingsPage.dart';
import 'package:decentproof/pages/submissionpage/SubmissionPage.dart';
import 'package:decentproof/pages/submissionpage/logic/ShowInExplorer.dart';
import 'package:decentproof/pages/verificationpage/VerificationPage.dart';
import 'package:decentproof/pages/videoimagepage/VideoImagePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //used ONLY for appcheck and nothing more
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const HomePage(),
    );
  }
}
