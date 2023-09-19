import 'package:decentproof/firebase_options.dart';
import 'package:decentproof/features/hashing/pages/AudioPage.dart';
import 'package:decentproof/pages/homepage/HomePage.dart';
import 'package:decentproof/features/intro/pages/IntroPage.dart';
import 'package:decentproof/features/intro/logic/firstTimeUserCheck.dart';
import 'package:decentproof/features/settings/pages/SettingsPage.dart';
import 'package:decentproof/pages/submissionpage/SubmissionPage.dart';
import 'package:decentproof/features/verification/pages/VerificationPage.dart';
import 'package:decentproof/pages/videoimagepage/VideoImagePage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider:
          kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug);
  runApp(EasyLocalization(
      useOnlyLangCode: true,
      fallbackLocale: const Locale("en"),
      path: "assets/translations",
      supportedLocales: const [
        Locale("en"),
        Locale("de"),
        Locale("sn"),
        Locale("fr"),
        Locale("jp"),
        Locale("zn")
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        "/videoImagePage": (context) => const VideoImagePage(),
        "/audioPage": (context) => const AudioPage(),
        "/submissionPage": (context) => const SubmissionPage(),
        "/verificationPage": (context) => const VerificationPage(),
        "/settingsPage": (context) => const SettingsPage()
      },
      title: 'Decentproof',
      theme:
          ThemeData(primaryColor: Colors.black, primarySwatch: Colors.orange),
      home: Builder(builder: (context) {
        return FutureBuilder(
            future: isFirstTimeUser(),
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return const IntroPage();
              }
              return const HomePage();
            });
      }),
    );
  }
}
