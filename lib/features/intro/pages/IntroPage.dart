import 'package:decentproof/features/hashing/bloc/BlockChainCubit/BlockChainCubit.dart';
import 'package:decentproof/features/hashing/uiblocks/BlockChainSelectionDialog.dart';
import 'package:decentproof/features/intro/uiblocks/IntoPages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blockChainCubit = context.read<BlockChainCubit>();
    return IntroductionScreen(
      pages: IntroPages().introPages,
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      dotsDecorator: const DotsDecorator(size: Size.square(6.5)),
      onSkip: () {
        Navigator.of(context).popAndPushNamed("/");
        if (blockChainCubit.state == null) {
          showDialog(
              context: context,
              builder: (context) => const BlockChainSelectionDialog(),
              barrierDismissible: false);
        }
      },
      onDone: () {
        Navigator.of(context).popAndPushNamed("/");
        if (blockChainCubit.state == null) {
          showDialog(
              context: context,
              builder: (context) => const BlockChainSelectionDialog(),
              barrierDismissible: false);
        }
      },
      skip: const Text("introPage.skip").tr(),
      done: const Text("introPage.done").tr(),
      next: const Text("introPage.next").tr(),
    );
  }
}
