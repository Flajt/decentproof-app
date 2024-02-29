import 'dart:async';

import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/metadata/bloc/LocationWarningBloc.dart';
import 'package:decentproof/features/metrics/bloc/MetricsBlocObserver.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/verification/bloc/VerificationBloc.dart';
import 'package:decentproof/firebase_options.dart';
import 'package:decentproof/features/hashing/pages/AudioPage.dart';
import 'package:decentproof/features/home/pages/HomePage.dart';
import 'package:decentproof/features/intro/pages/IntroPage.dart';
import 'package:decentproof/features/intro/logic/firstTimeUserCheck.dart';
import 'package:decentproof/features/settings/pages/SettingsPage.dart';
import 'package:decentproof/features/hashing/pages/SubmissionPage.dart';
import 'package:decentproof/features/verification/pages/VerificationPage.dart';
import 'package:decentproof/features/hashing/pages/VideoImagePage.dart';
import 'package:decentproof/shared/util/initSentry.dart';
import 'package:decentproof/shared/util/register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await registar();
    await dotenv.load();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
        androidProvider: kReleaseMode
            ? AndroidProvider.playIntegrity
            : AndroidProvider.debug);
    await initSentry();
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
          Locale("zn"),
          Locale("ar")
        ],
        child: const MyApp()));
    Bloc.observer = MetricsBlocObserver();
  }, (error, stack) {
    Sentry.captureException(error, stackTrace: stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => VerificationBloc()),
        BlocProvider(create: (context) => SubmissionBloc()),
        BlocProvider(create: (context) => PreparationBloc()),
        BlocProvider(create: (context) => LocationWarningBloc())
      ],
      child: MaterialApp(
        navigatorObservers: [SentryNavigatorObserver()],
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
        darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                onBackground: const Color(0xff191919),
                seedColor: Colors.orange)),
        title: 'Decentproof',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.black),
        home: Builder(builder: (context) {
          return FutureBuilder(
              future: isFirstTimeUser(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return const IntroPage();
                }
                return HomePage();
              });
        }),
      ),
    );
  }
}
