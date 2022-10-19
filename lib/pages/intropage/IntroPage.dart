import 'package:decentproof/pages/intropage/uiblocks/IntoPages.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: introPages,
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      dotsDecorator: DotsDecorator(size: Size.square(6.5)),
      onSkip: () => Navigator.of(context).popAndPushNamed("/"),
      onDone: () => Navigator.of(context).popAndPushNamed("/"),
      skip: Text("Skip"),
      done: Text("Done"),
      next: Text("Next"),
    );
  }
}
