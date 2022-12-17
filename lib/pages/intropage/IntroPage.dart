import 'dart:io';

import 'package:decentproof/pages/intropage/uiblocks/IntoPages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: IntroPages().introPages,
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      dotsDecorator: const DotsDecorator(size: Size.square(6.5)),
      onSkip: () => Navigator.of(context).popAndPushNamed("/"),
      onDone: () => Navigator.of(context).popAndPushNamed("/"),
      skip: const Text("Skip"),
      done: const Text("Done"),
      next: const Text("Next"),
    );
  }
}
